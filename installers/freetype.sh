freetypeInstall() 
{
	if [ ! -d $freetype ]; then
		echo "Installing yasm 1.3.0..."
		curl -O https://download.savannah.gnu.org/releases/freetype/freetype-2.4.0.tar.gz && tar -xvf freetype-2.4.0.tar.gz
		cd $freetype && ./configure --prefix="$BUILD_DIR" --bindir="$BUILD_DIR/bin"
		make && make install
	fi
}
