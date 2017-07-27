x264Install()
{
	if [ ! -d $libx264 ]; then
		echo "Installing H.264..."
		git clone --depth 1 http://git.videolan.org/git/x264
		cd $libx264
		PKG_CONFIG_PATH="$BUILD_DIR/lib/pkgconfig" ./configure --prefix="$BUILD_DIR" --bindir="$BUILD_DIR/bin" --enable-static
		make
		make install
		echo
	fi
}