#!/bin/sh

cd rust

~/.cargo/bin/cargo lipo --release
~/.cargo/bin/cbindgen src/lib.rs -l c > rust.h

cd ..

mkdir -p swift/include
mkdir -p swift/lib

cp rust/rust.h swift/include/
cp rust/target/universal/release/librust.a swift/lib/