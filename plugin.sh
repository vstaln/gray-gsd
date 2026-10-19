#!/bin/sh
here="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
sys="$(uname -s)"
case "$sys" in
MINGW* | MSYS* | CYGWIN*) rel="x86_64-pc-windows-msvc/gray-gsd.exe" ;;
Darwin*)
    case "$(uname -m)" in
    arm64) rel="aarch64-apple-darwin/gray-gsd" ;;
    *) rel="x86_64-apple-darwin/gray-gsd" ;;
    esac ;;
*)
    case "$(uname -m)" in
    aarch64 | arm64) rel="aarch64-unknown-linux-musl/gray-gsd" ;;
    *) rel="x86_64-unknown-linux-musl/gray-gsd" ;;
    esac ;;
esac
if [ -x "$here/$rel" ]; then exec "$here/$rel" "$@"; fi
for cand in "$here/target/release/gray-gsd.exe" "$here/target/release/gray-gsd" "$here/target/debug/gray-gsd.exe" "$here/target/debug/gray-gsd"; do
    if [ -x "$cand" ]; then exec "$cand" "$@"; fi
done
echo "gray-gsd binary not found in $here" >&2
exit 1
