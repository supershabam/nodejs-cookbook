# nodejs-cookbook

Installs nodejs from [nodejs.org](http://nodejs.org) provided binaries

## Platform

Written with intent to support Ubuntu 12.04 LTS, but should work with most linuxy things.

## Attributes

* `architecture` target architecture `x64` or `x86`
* `checksum` provided on [npmjs.org](http://nodejs.org/dist/v0.10.15/SHASUMS.txt)
* `dest` where to download tarball and extract source (kept on-disk for your pleasure)
* `install_to` where to place the `node` and `npm` binaries
* `version` version to ensure is installed and used in url for downloading tarball

## LICENSE

MIT