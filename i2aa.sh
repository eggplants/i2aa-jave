#!/bin/bash

readonly VERSION='1.0.0'
readonly JAVEPATH='/usr/local/src/jave5/jave5.jar'

command -v java >/dev/null || {
  echo 'Please install Java' >&2
  exit 1
}

[ -f "$JAVEPATH" ] || {
  echo 'Please install JavE5:
    $ wget http://www.jave.de/download/jave5.zip
    $ sudo unzip jave5.zip -d /usr/local/src/jave5' >&2
  exit 1
}

WIDTH='72'
ALGORITHM='4'

_usage(){

echo 'JavE commadline interface.

Supported syntax:
  i2aa INPUTFILE [-w|--width width] [-a|--algorithm algorithm] [-h|--help] [-v|--version]
    INPUTFILE is the name (and path) to the gif/jpg image)
    width     is the width in characters of the result.
              The default value is 72.
    algorithm is the name of the conversion algorithm.
              Supported algorithms are:
                 1 (Pixel per Character)
                 4 (Pixels per Character) (default)'
}

_exe_i2a(){
  java -jar "$JAVEPATH" i2a "$1" width="${WIDTH}" algorithm="${ALGORRITHM}"
}

main(){
  args=$(getopt -o w:a:hv -l width:,algorithm:,help,version -- "$@")
  if [ $? != 0 ]; then
      _usage >&2
      exit 1
  fi
  eval set -- "$args"
  for OPT in "$@"
  do
    case $OPT in
      -w | --width)
        [[ "$2" =~ ^[0-9][0-9]*$ ]] || {
          echo "Wrong number format for width: '$2'" >&2
        }
        WIDTH="$2"
        shift 2
        ;;
      -a | --algorithm)
        [[ "$2" =~ ^[14]$ ]] || {
          echo "No such algorithm: '$2'" >&2
          exit 1
        }
        ALGORITHM="$2"
        shift 2
        ;;
      -h | --help)
        _usage
        exit 0
        ;;
      -v | --version)
        echo "i2a v$VERSION"
        exit 1
        ;;
      --)
        shift
        break
        ;;
      -* | --*)
        echo "Unknown option: '$2'" >&2
        exit 1
        ;;
    esac
  done
  [[ "$#" != 1 ]] && {
    echo "IMAGEFILE must be one." >&2
    exit 1
  }
  [[ -f "$1" ]] || {
    echo "File does not exist: '$1'" >&2
    exit 1
  }
  [[ "$(file "$1")" =~ 'image data,' ]] || {
    echo "File does not seem not to be image: '$1'" >&2
    exit 1
  }
  _exe_i2a "$1"
}

main "$@"
exit "$?"
