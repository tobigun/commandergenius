#!/bin/sh

LOCAL_PATH=`dirname $0`
LOCAL_PATH=`cd $LOCAL_PATH && pwd`

# Hacks for broken configure scripts
#rm -rf $LOCAL_PATH/../../obj/local/armeabi/libSDL_*.so
#rm -rf $LOCAL_PATH/../../obj/local/armeabi/libsdl_main.so

# Uncomment if your configure expects SDL libraries in form "libSDL_name.so"
#if [ -e $LOCAL_PATH/../../obj/local/armeabi/libsdl_mixer.so ] ; then
#	ln -sf libsdl_mixer.so $LOCAL_PATH/../../obj/local/armeabi/libSDL_Mixer.so
#fi

#for F in $LOCAL_PATH/../../obj/local/armeabi/libsdl_*.so; do
#	LIBNAME=`echo $F | sed "s@$LOCAL_PATH/../../obj/local/armeabi/libsdl_\(.*\)[.]so@\1@"`
#	ln -sf libsdl_$LIBNAME.so $LOCAL_PATH/../../obj/local/armeabi/libSDL_$LIBNAME.so
#done

echo "#######################################   script"

if [ \! -f residualvm/config.mk ] ; then
	../setEnvironment.sh sh -c "cd residualvm && env LIBS='-lgcc -lgnustl_static' ./configure --host=androidsdl --enable-vkeybd --enable-verbose-build --disable-readline --disable-nasm --disable-taskbar --datadir=."
fi
rm -f residualvm/residualvm libapplication.so
../setEnvironment.sh nice make -C residualvm -j4
if [ -e residualvm/residualvm ]; then
	cp -f residualvm/residualvm libapplication.so
fi
