x265Install() 
{
	if [ ! -d $libx265 ]; then
		echo "Installing H.265/HEVC..."
		hg clone https://bitbucket.org/multicoreware/x265
		cd $libx265/build/linux
		cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$BUILD_DIR" -DENABLE_SHARED:bool=off ../../source
		make
		make install
		echo
	fi
}