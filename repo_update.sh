#!/bin/bash

# 実行例： repo_update.sh ~/android/aicp

# 実行時の引数が正しいかチェック
if [ $# -lt 1 ]; then
	echo "指定された引数は$#個です。" 1>&2
	echo "仕様: $CMDNAME [ビルドディレクトリの絶対パス]" 1>&2
	exit 1
fi

builddir=$1

cd $builddir

# repo sync
echo "* Syncing repo"
repo sync -j8 -c -f --force-sync --no-clone-bundle
echo -e "\n"

# Sony
echo "* Updating Sony open devices repo"

echo -e "\n"
echo "******************"
echo "device/sony/common"
echo "******************"

cd $builddir/device/sony/common
git rev-parse --abbrev-ref @ | grep n7.1 >/dev/null
if [ "$?" == "1" ] ; then
	git checkout n7.1
fi
git ls-remote --heads sony n-mr1 | grep n-mr1 >/dev/null
if [ "$?" == "1" ] ; then
	git remote add sony https://github.com/sonyxperiadev/device-sony-common.git
fi
git pull --no-edit sony n-mr1
git push github n7.1

echo -e "\n"
echo "******************"
echo "device/sony/yoshino"
echo "******************"

cd $builddir/device/sony/yoshino
git rev-parse --abbrev-ref @ | grep n7.1 >/dev/null
if [ "$?" == "1" ] ; then
	git checkout n7.1
fi
git ls-remote --heads sony n-mr1 | grep n-mr1 >/dev/null
if [ "$?" == "1" ] ; then
	git remote add sony https://github.com/sonyxperiadev/device-sony-yoshino.git
fi
git pull --no-edit sony n-mr1
git push github n7.1

echo -e "\n"
echo "******************"
echo "device/sony/maple"
echo "******************"

cd $builddir/device/sony/maple
git rev-parse --abbrev-ref @ | grep n7.1 >/dev/null
if [ "$?" == "1" ] ; then
	git checkout n7.1
fi
git ls-remote --heads sony n-mr1 | grep n-mr1 >/dev/null
if [ "$?" == "1" ] ; then
	git remote add sony https://github.com/sonyxperiadev/device-sony-maple.git
fi
git pull --no-edit sony n-mr1
git push github n7.1

echo -e "\n"
echo "******************"
echo "hardware/sony/camera"
echo "******************"

cd $builddir/hardware/sony/camera
git rev-parse --abbrev-ref @ | grep n7.1 >/dev/null
if [ "$?" == "1" ] ; then
	git checkout n7.1
fi
git ls-remote --heads sony aosp/LA.UM.5.7.r1 | grep aosp/LA.UM.5.7.r1 >/dev/null
if [ "$?" == "1" ] ; then
	git remote add sony https://github.com/sonyxperiadev/camera.git
fi
git pull --no-edit sony aosp/LA.UM.5.7.r1
git push github n7.1

echo -e "\n"
echo "******************"
echo "kernel/sony/msm"
echo "******************"

cd $builddir/kernel/sony/msm
git rev-parse --abbrev-ref @ | grep aosp/LA.UM.5.7.r1 >/dev/null
if [ "$?" == "1" ] ; then
	git checkout aosp/LA.UM.5.7.r1
fi
git ls-remote --heads sony aosp/LA.UM.5.7.r1 | grep aosp/LA.UM.5.7.r1 >/dev/null
if [ "$?" == "1" ] ; then
	git remote add sony https://github.com/sonyxperiadev/kernel.git
fi
git pull --no-edit sony aosp/LA.UM.5.7.r1
git push github aosp/LA.UM.5.7.r1

echo -e "\n"

# LineageOS
echo "* Updating LineageOS repo"

echo -e "\n"
echo "******************"
echo "external/libnfc-nci"
echo "******************"

cd $builddir/external/libnfc-nci
git rev-parse --abbrev-ref @ | grep n7.1 >/dev/null
if [ "$?" == "1" ] ; then
	git checkout n7.1
fi
git ls-remote --heads los cm-14.1 | grep cm-14.1 >/dev/null
if [ "$?" == "1" ] ; then
	git remote add los https://github.com/LineageOS/android_external_libnfc-nci.git
fi
git pull --no-edit los cm-14.1
git push github n7.1

echo -e "\n"
echo "******************"
echo "hardware/qcom/bt"
echo "******************"

cd $builddir/hardware/qcom/bt
git rev-parse --abbrev-ref @ | grep n7.1 >/dev/null
if [ "$?" == "1" ] ; then
	git checkout n7.1
fi
git ls-remote --heads los cm-14.1 | grep cm-14.1 >/dev/null
if [ "$?" == "1" ] ; then
	git remote add los https://github.com/LineageOS/android_hardware_qcom_bt.git
fi
git pull --no-edit los cm-14.1
git push github n7.1

echo -e "\n"
echo "******************"
echo "hardware/qcom/display"
echo "******************"

cd $builddir/hardware/qcom/display
git rev-parse --abbrev-ref @ | grep n7.1 >/dev/null
if [ "$?" == "1" ] ; then
	git checkout n7.1
fi
git ls-remote --heads los cm-14.1 | grep cm-14.1 >/dev/null
if [ "$?" == "1" ] ; then
	git remote add los https://github.com/LineageOS/android_hardware_qcom_display.git
fi
git pull --no-edit los cm-14.1
git push github n7.1

echo -e "\n"
echo "******************"
echo "hardware/qcom/media"
echo "******************"

cd $builddir/hardware/qcom/media
git rev-parse --abbrev-ref @ | grep n7.1 >/dev/null
if [ "$?" == "1" ] ; then
	git checkout n7.1
fi
git ls-remote --heads los cm-14.1 | grep cm-14.1 >/dev/null
if [ "$?" == "1" ] ; then
	git remote add los https://github.com/LineageOS/android_hardware_qcom_media.git
fi
git pull --no-edit los cm-14.1
git push github n7.1

echo -e "\n"
echo "* Updated successfully!"
cd $builddir
