TERMUX_PKG_HOMEPAGE=https://deno.land
TERMUX_PKG_DESCRIPTION="A simple,modern and secure runtime for JavaScript and TypeScript"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Krishna Kanhaiya @kcubeterm"
TERMUX_PKG_VERSION=1.11.2
TERMUX_PKG_DEPENDS="glib"
TERMUX_PKG_SRCURL=https://github.com/denoland/deno/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=236b6dcbabe0fece1955228b117911244329460dd72c74fbf85c878d5076a3aa
#TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
	termux_setup_rust
	cd "$TERMUX_PKG_SRCDIR"
	V8_FROM_SOURCE=1 cargo build --jobs $TERMUX_MAKE_PROCESSES \
	--target $CARGO_TARGET_NAME --release
	install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/deno
	#install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/

}
