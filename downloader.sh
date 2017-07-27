downloadInstallers()
{
	if [ ! -s "$INSTALLER_DIR/yasm.sh" ]; then
		#Download the install script from github
		wget https://raw.githubusercontent.com/XAOS-Interactive/FFMPEG-Installer/master/installers/yasm.sh -O $INSTALLERS_DIR/yasm.sh
	fi

	if [ ! -s "$INSTALLER_DIR/x264.sh" ]; then
		#Download the install script from github
		wget https://raw.githubusercontent.com/XAOS-Interactive/FFMPEG-Installer/master/installers/x264.sh -O $INSTALLERS_DIR/x264.sh
	fi

	if [ ! -s "$INSTALLER_DIR/x265.sh" ]; then
		#Download the install script from github
		wget https://raw.githubusercontent.com/XAOS-Interactive/FFMPEG-Installer/master/installers/x265.sh -O $INSTALLERS_DIR/x265.sh
	fi
	
	if [ ! -s "$INSTALLER_DIR/libfdk.sh" ]; then
		#Download the install script from github
		wget https://raw.githubusercontent.com/XAOS-Interactive/FFMPEG-Installer/master/installers/libfdk.sh -O $INSTALLERS_DIR/libfdk.sh
	fi
	
	if [ ! -s "$INSTALLER_DIR/libmp3lame.sh" ]; then
		#Download the install script from github
		wget https://raw.githubusercontent.com/XAOS-Interactive/FFMPEG-Installer/master/installers/libfdk.sh -O $INSTALLERS_DIR/libmp3lame.sh
	fi
	
	if [ ! -s "$INSTALLER_DIR/libopus.sh" ]; then
		#Download the install script from github
		wget https://raw.githubusercontent.com/XAOS-Interactive/FFMPEG-Installer/master/installers/libfdk.sh -O $INSTALLERS_DIR/libopus.sh
	fi
	
	if [ ! -s "$INSTALLER_DIR/libogg.sh" ]; then
		#Download the install script from github
		wget https://raw.githubusercontent.com/XAOS-Interactive/FFMPEG-Installer/master/installers/libfdk.sh -O $INSTALLERS_DIR/libogg.sh
	fi
	
	if [ ! -s "$INSTALLER_DIR/libvpx.sh" ]; then
		#Download the install script from github
		wget https://raw.githubusercontent.com/XAOS-Interactive/FFMPEG-Installer/master/installers/libfdk.sh -O $INSTALLERS_DIR/libvpx.sh
	fi
	
	if [ ! -s "$INSTALLER_DIR/ffmpeg.sh" ]; then
		#Download the install script from github
		wget https://raw.githubusercontent.com/XAOS-Interactive/FFMPEG-Installer/master/installers/ffmpeg.sh -O $INSTALLERS_DIR/ffmpeg.sh
	fi
}