#!/usr/bin/env sh

set -eu

prefix=$(pwd)/dest

tar xf npth-*.tar.bz2
(
  cd npth-* || exit
  ./configure --prefix="$prefix"
  make -j 8
  make install
)
tar xf libgpg-error-*.tar.bz2
(
  cd libgpg-error-* || exit
  ./configure --prefix="$prefix"
  make -j 8
  make install
)
tar xf libgcrypt-*.tar.bz2
patch -p 1 < md.patch
(
  cd libgcrypt-* || exit
  ./configure --prefix="$prefix" --with-libgpg-error-prefix="$prefix"
  make -j 8
  make install
)
tar xf libksba-*.tar.bz2
(
  cd libksba-* || exit
  ./configure --prefix="$prefix" --with-libgpg-error-prefix="$prefix"
  make -j 8
  make install
)
tar xf libassuan-*.tar.bz2
(
  cd libassuan-* || exit
  ./configure --prefix="$prefix" --with-libgpg-error-prefix="$prefix"
  make -j 8
  make install
)
tar xf gnupg-*.tar.bz2
(
  cd gnupg-* || exit
  ./configure \
    --prefix="$prefix" \
    --with-npth-prefix="$prefix" \
    --with-libgpg-error-prefix="$prefix" \
    --with-libgcrypt-prefix="$prefix" \
    --with-libassuan-prefix="$prefix" \
    --with-ksba-prefix="$prefix" \
    LDFLAGS="-Wl,--rpath=$prefix/lib" \
  ;
  make -j 8
  make install
)
