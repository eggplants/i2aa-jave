# `i2a`

- CLI for [JavE5](http://www.jave.de/)

## Usage

```bash
$ i2a --help
JavE commadline interface.

Supported syntax:
  i2a INPUTFILE [-w|--width width] [-a|--algorithm algorithm] [-h|--help] [-v|--version]
    INPUTFILE is the name (and path) to the gif/jpg image)
    width     is the width in characters of the result.
              The default value is 72.
    algorithm is the name of the conversion algorithm.
              Supported algorithms are:
                 1 (Pixel per Character)
                 4 (Pixels per Character) (default)
$ convert wizard: wiz.png
$ i2a wiz.png -w 30


    ...
      TC1i.  ..
       ?Hkni J1?~```
       (9IJz^      ``
       jk&_<(--  `   `
      .Wfk0cnZ! ....  ```.n
      dHHHRG:  (#3(>````.<C
      JMHNpkL ?99MD``..(` <
      WM@MNkkXz,-._..-/   <
     .HHHHMMHHHWH---(d<   ~
      ZHHHHHNMHHW    O:..(<
      (.@HgMWMHpK~~_<(Y<-,<
     .:WbdHHJHHWD    (`  ?<
     ((?IX7XdHHfy..  (   .>
    .!  (^  .WHKY'   +   .>
        +    `       7


```

## Install

- Setup JavE5

```bash
wget http://www.jave.de/download/jave5.zip && unzip jave5.zip -d /usr/local/src/jave5
```

```bash
$ git clone --depth 1 https://github.com/eggplants/i2a && cd i2a
$ sudo install -m 0755 i2a.sh /usr/local/bin/i2a
```
