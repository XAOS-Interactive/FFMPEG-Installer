#!/usr/bin/bash

#Build Directory Settings
INSTALLER_DIR=/opt/ffmpeg_installer
INSTALLERS_DIR=/opt/ffmpeg_installer/installers
BUILD_DIR=/opt/ffmpeg_build
SOURCES_DIR=/opt/ffmpeg_sources
NASM_REPO=/etc/yum.repos.d/nasm.repo

#Sources
yasm=$SOURCES_DIR/yasm-1.3.0
libx264=$SOURCES_DIR/x264
libx265=$SOURCES_DIR/x265
libfdk_aac=$SOURCES_DIR/fdk-aac
libmp3lame=$SOURCES_DIR/lame-3.99.5
libopus=$SOURCES_DIR/opus-1.1.5
libogg=$SOURCES_DIR/libogg-1.3.2
libvorbis=$SOURCES_DIR/libvorbis-1.3.4
libvpx=$SOURCES_DIR/libvpx
ffmpeg=$SOURCES_DIR/ffmpeg
freetype=$SOURCES_DIR/freetype-2.4.0

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
  mkdir $BUILD_DIR/bin
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
. $INSTALLERS_DIR/freetype.sh

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

#Install freetyp2
cd $SOURCES_DIR
freetypeInstall

#Finally install ffmpeg
cd $SOURCES_DIR
ffmpegInstall


