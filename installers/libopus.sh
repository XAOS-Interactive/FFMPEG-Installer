opusInstall() 
{
	if [ ! -d $libopus ]; then
		echo "Installing opus 1.1.5..."
		curl -O -L https://archive.mozilla.org/pub/opus/opus-1.3.tar.gz
		tar xzvf opus-1.3.tar.gz
		cd $libopus
		./configure --prefix="$BUILD_DIR" --disable-shared
		make
		make install
	fi
}
