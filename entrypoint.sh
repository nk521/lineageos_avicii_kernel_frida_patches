ROOTDIR=/home/kernel
BUILD_DIR=$ROOTDIR/build
KERNEL_DIR=$ROOTDIR/android_kernel_oneplus_sm7250

PREBUILT_CLANG=$ROOTDIR/android_prebuilts_clang_kernel_linux-x86_clang-r416183b/bin
BUILD_TOOLS=$ROOTDIR/build-tools/linux-x86/bin
PREBUILT_ARM_LINKER=$ROOTDIR/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9/aarch64-linux-android/bin
PREBUILT_GCC=$ROOTDIR/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9/bin
PREBUILT_LINEAGE_TOOLS=$ROOTDIR/android_prebuilts_tools-lineage/linux-x86/bin

rm -rf $BUILD_DIR && mkdir $BUILD_DIR

cd $KERNEL_DIR

# git clone --depth=1 https://github.com/LineageOS/android_kernel_oneplus_sm7250
# git clone --depth=1 -b lineage-19.1 https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.git
# git clone --depth=1 https://github.com/LineageOS/android_prebuilts_clang_kernel_linux-x86_clang-r416183b.git
# git clone --depth=1 -b android-14.0.0_r0.139 https://android.googlesource.com/kernel/prebuilts/build-tools
# git clone --depth=1 https://github.com/LineageOS/android_prebuilts_tools-lineage.git

make mrproper

BINARIES=$PATH:$PREBUILT_CLANG:$BUILD_TOOLS:$PREBUILT_ARM_LINKER:$PREBUILT_GCC:$PREBUILT_LINEAGE_TOOLS

make O=$BUILD_DIR ARCH=arm64 PATH=$BINARIES CC=clang CROSS_COMPILE=aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu- BRAND_SHOW_FLAG=oneplus vendor/lito-perf_defconfig vendor/debugfs.config

make -j$(nproc) O=$BUILD_DIR ARCH=arm64 PATH=$BINARIES CC=clang CROSS_COMPILE=aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu- DEFCONFIG=lito-perf_defconfig DTC_EXT=$ROOTDIR/android_prebuilts_tools-lineage/linux-x86/dtc/dtc BRAND_SHOW_FLAG=oneplus
