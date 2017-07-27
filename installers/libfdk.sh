libfdkInstall()
{
	if [ ! -d $libfdk_aac ]; then
		echo "Installing AAC audio encoder..."
		git clone --depth 1 https://github.com/mstorsjo/fdk-aac
		cd $libfdk_aac
		autoreconf -fiv
		./configure --prefix="$BUILD_DIR" --disable-shared
		make
		make install
		echo
	fi
}