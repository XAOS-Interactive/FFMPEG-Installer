vorbisInstall()
{
	if [ ! -d $libvorbis ]; then
		echo "Installing Vorbis 1.3.4..."
		curl -O http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.4.tar.gz
		tar xzvf libvorbis-1.3.4.tar.gz
		cd $libvorbis
		./configure --prefix="$BUILD_DIR" --with-ogg="$BUILD_DIR" --disable-shared
		make
		make install
		echo
	fi
}