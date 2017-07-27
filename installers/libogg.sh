oggInstall() 
{
	if [ ! -d $libogg ]; then 
		echo "Installing Ogg 1.3.2..."
		curl -O http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz && tar xzvf libogg-1.3.2.tar.gz
		cd $libogg && ./configure --prefix="$BUILD_DIR" --disable-shared
		make && make install
		echo
	fi
}