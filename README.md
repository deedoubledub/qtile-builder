# Qtile Builder

Generate a deb package to install [Qtile](http://www.qtile.org) on Ubuntu 20.04.

## Build the image

```
$ cd qtile-builder
$ docker build -t qtile_builder .
```

## Generate the deb

`$ ./run.sh`

The raw files along with a deb package will be generated in `./build`

## Install Qtile
`$ sudo apt install ./build/qtile_<version>_amd64.deb`
