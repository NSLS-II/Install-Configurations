rm -rf vendor/ffmpeg*
rm -rf vendor/yasm*
FFMPEG="https://ffmpeg.org/releases/ffmpeg-4.0.2.tar.xz"
YASM="http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz"

for z in $FFMPEG $YASM; do
    wget -P vendor $z
done

tar Jxvf vendor/$(basename $FFMPEG) -C vendor
tar xvf vendor/$(basename $YASM) -C vendor

rm vendor/*.xz
rm vendor/*.gz

mv vendor/ffmpeg-4.0.2 vendor/ffmpeg
mv vendor/yasm-1.2.0 vendor/yasm

make -sj

rm vendor/ffmpeg-linux-x86_64/src
cp vendor/ffmpeg vendor/ffmpeg-linux-x86_64/src

