vpxInstall() 
{
	if [ ! -d $libvpx ]; then
		echo "Installing VP8/VP9..."
		git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
		cd $libvpx
		./configure --prefix="$BUILD_DIR" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm
		PATH="$BUILD_DIR/bin:$PATH" make
		make install
		echo
	fi
}