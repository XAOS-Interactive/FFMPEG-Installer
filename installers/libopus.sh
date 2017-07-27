opusInstall() 
{
	if [ ! -d $libopus ]; then
		echo "Installing opus 1.1.5..."
		curl -O https://archive.mozilla.org/pub/opus/opus-1.1.5.tar.gz
		tar xzvf opus-1.1.5.tar.gz
		cd $libopus
		make
		make install
	fi
}