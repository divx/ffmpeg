#!/bin/sh

OUTPUT_FOLDER="Output/Windows7/x86"

echo "Changing to output directory: "$OUTPUT_FOLDER
cd $OUTPUT_FOLDER

echo "Configuring makefiles"
../../../configure \
--toolchain=msvc \
--disable-gpl \
--disable-nonfree \
--disable-programs \
--disable-dxva2 \
--disable-d3d11va \
--disable-encoders \
--disable-decoders \
--enable-decoder=ac3 \
--enable-decoder=ac3_fixed \
--enable-decoder=eac3 \
--disable-demuxers \
--disable-filters \
--disable-avformat \
--enable-swresample \
--disable-swscale \
--disable-postproc \
--disable-avfilter \
--disable-avdevice \
--disable-parsers \
--disable-bsfs \
--disable-outdevs \
--disable-indevs \
--disable-devices \
--enable-parser=ac3 \
--disable-muxers \
--arch=x86 \
--enable-shared \
--enable-cross-compile \
--target-os=win32 \
--extra-cflags="-MD -D_WIN32_WINNT=0x0601" \
--extra-ldflags="-APPCONTAINER" \
--prefix=../../../$OUTPUT_FOLDER


#-DWINAPI_FAMILY=WINAPI_FAMILY_PC_APP 

echo "Building code"
make

# --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
echo "Installing code"
make install
