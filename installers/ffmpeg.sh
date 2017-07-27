ffmpegInstall() 
{
	if [ ! -d $ffmpeg ]; then
		echo "Installing FFMPEG..."
		curl -O http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
		tar xjvf ffmpeg-snapshot.tar.bz2
		cd $ffmpeg
		PKG_CONFIG_PATH="$BUILD_DIR/lib/pkgconfig" ./configure --prefix="$BUILD_DIR" \
		--extra-cflags="-I$BUILD_DIR/include" --extra-ldflags="-L$BUILD_DIR/lib -ldl" \
		--bindir="$HOME/bin" --pkg-config-flags="--static" \
		--enable-gpl \
		--enable-libfdk_aac \
		--enable-libfreetype \
		--enable-libmp3lame \
		--enable-libopus \
		--enable-libvorbis \
		--enable-libvpx \
		--enable-libx264 \
		--enable-libx265 \
		--enable-nonfree
		make
		make install
		hash -r
	fi
}