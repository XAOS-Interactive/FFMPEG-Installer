yasmInstall() 
{
	if [ ! -d $yasm ]; then
		echo "Installing yasm 1.3.0..."
		curl -O http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
		cd $yasm
		./configure --prefix="$BUILD_DIR" --bindir="$BUILD_DIR/bin"
		make
		make install
	fi
}