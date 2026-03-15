Sources:
* https://nullptr.icu/index.php/archives/182/
* https://qweraqq.github.io/security/2024/04/06/android-frida-detection-and-bypass.html
* https://thedoc.eu.org/blog/lineage-os-20-kernel-wireguard-module/
* https://wiki.lineageos.org/devices/avicii/build/
* https://github.com/LineageOS/android_device_oneplus_avicii/blob/3f1270c2871e9893332073eb0f8f5f9499abbf13/BoardConfig.mk#L118

On opensuse WSL --

```shell
sudo zypper install \
bc bison gcc gcc-c++ make \
ccache curl cpio flex \
git git-lfs gnupg gperf \
ImageMagick \
glibc-devel-32bit \
ncurses-devel ncurses-devel-32bit \
readline-devel readline-devel-32bit \
zlib-devel zlib-devel-32bit \
libelf-devel \
lz4 \
libSDL-devel \
libopenssl-devel \
libxml2 libxml2-devel \
lzop pngcrush rsync \
squashfs \
libxslt-tools \
zip \
python3 \
which
```

* Kernel image is located here `build/arch/arm64/boot/Image`.
* Original boot.img can be obtained from the [official build](https://b4.timschumi.net/lineage-archive/lineage-21.0-20240619-nightly-avicii-signed.zip).
* Unzip and unpack using [payload dumper](https://github.com/ssut/payload-dumper-go). `payload-dumper-go -p boot payload.bin`
* Put it in [Android_boot_image_editor](https://github.com/cfig/Android_boot_image_editor). Unpack it.
* Push your kernel image in root and rename `Image` to `kernel`.
* Pack image.
* Push it to your phone and ask magisk to patch it.
* Flash using fastboot.
* Checkout https://www.reddit.com/r/Magisk/comments/1lhgla3/how_to_get_strong_integrity_the_complete/.
