lameInstall()
{
	if [ ! -d $libmp3lame ]; then
		curl -L -O http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
		tar xzvf lame-3.99.5.tar.gz
		cd $libmp3lame
		./configure --prefix="$BUILD_DIR" --bindir="$BUILD_DIR/bin" --disable-shared --enable-nasm
		make
		make install
		echo
	fi
}