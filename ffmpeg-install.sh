#!/usr/bin/bash

#Build Directory Settings
export INSTALLER_DIR=/opt/ffmpeg_installer
export INSTALLERS_DIR=/opt/ffmpeg_installer/installers
export BUILD_DIR=/opt/ffmpeg_build
export SOURCES_DIR=/opt/ffmpeg_sources
export NASM_REPO=/etc/yum.repos.d/nasm.repo

#Sources
export yasm=$SOURCES_DIR/yasm-1.3.0
export libx264=$SOURCES_DIR/x264
export libx265=$SOURCES_DIR/x265
export libfdk_aac=$SOURCES_DIR/fdk-aac
export libmp3lame=$SOURCES_DIR/lame-3.99.5
export libopus=$SOURCES_DIR/opus-1.1.5
export libogg=$SOURCES_DIR/libogg-1.3.2
export libvorbis=$SOURCES_DIR/libvorbis-1.3.4
export libvpx=$SOURCES_DIR/libvpx
export ffmpeg=$SOURCES_DIR/ffmpeg

# Am I root?
if [ "x$(id -u)" != 'x0' ]; then
    echo 'Error: this script can only be executed by root'
    exit 1
fi

echo "Installing Yum Prereqs..."
yum install epel-release nano wget -y

if [ ! -d $INSTALLER_DIR ]; then
  mkdir $INSTALLER_DIR
  mkdir $INSTALLERS_DIR
  echo "Installer Directory created, continuing install..."
fi

if [ ! -d $BUILD_DIR ]; then
  mkdir $BUILD_DIR
  echo "Build directory created, continuing install..."
fi

if [ ! -d $SOURCES_DIR ]; then
  mkdir $SOURCES_DIR
  echo "Sources directory created, continuing install..."
fi

if [ ! -s $NASM_REPO ]; then
  echo "Installing NASM Repo..."
  wget http://nasm.us/nasm.repo -O $NASM_REPO
fi

echo "Installing Prereqs..."
yum -y install autoconf automake bzip2 cmake freetype-devel gcc gcc-c++ git libtool
yum -y install make mercurial nasm pkgconfig zlib-devel

echo "Downloading Installer Packages..."
if [[ ! -s "$INSTALLER_DIR/downloader.sh" ]]
then
	#Download downloader script
	wget https://raw.githubusercontent.com/XAOS-Interactive/FFMPEG-Installer/master/downloader.sh -O $INSTALLER_DIR/downloader.sh
fi

# Defning return code check function
check_result() {
    if [ $1 -ne 0 ]; then
        echo "Error: $2"
        exit $1
    fi
}

. $INSTALLER_DIR/downloader.sh

downloadInstallers

#Load the installers
. $INSTALLERS_DIR/yasm.sh
. $INSTALLERS_DIR/x264.sh
. $INSTALLERS_DIR/x265.sh
. $INSTALLERS_DIR/libfdk.sh
. $INSTALLERS_DIR/libmp3lame.sh
. $INSTALLERS_DIR/libopus.sh
. $INSTALLERS_DIR/libogg.sh
. $INSTALLERS_DIR/libvorbis.sh
. $INSTALLERS_DIR/libvpx.sh
. $INSTALLERS_DIR/ffmpeg.sh

#Run the installers
#Install yasm
cd $SOURCES_DIR
yasmInstall

#Install libx264
cd $SOURCES_DIR
x264Install

#Install libx265
cd $SOURCES_DIR
x265Install

#Install libfdk_aac
cd $SOURCES_DIR
libfdkInstall

#Install libmp3lame
cd $SOURCES_DIR
lameInstall

#Install libopus
cd $SOURCES_DIR
opusInstall

#Install libogg
cd $SOURCES_DIR
oggInstall

#Install libvorbis
cd $SOURCES_DIR
vorbisInstall

#Install libvpx
cd $SOURCES_DIR
vpxInstall

#Finally install ffmpeg
cd $SOURCES_DIR
ffmpegInstall


