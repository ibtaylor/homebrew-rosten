require 'formula'

class Libcvd < Formula
  homepage 'http://www.edwardrosten.com/cvd/'
  url 'https://github.com/edrosten/libcvd/archive/RELEASE_20121025.2.zip'
  sha256 'ab481cda17d95762f4636f768e226056d954e936f27f63ece565aa7f5d61fc10'

  depends_on :x11 => :recommended
  depends_on 'toon' => :recommended
  depends_on 'ffmpeg' => :recommended
  depends_on 'libpng' => :recommended
  depends_on 'libjpeg' => :recommended
  depends_on 'libtiff' => :recommended

  def x11flags
    build.with?('x11') ? '--with-x' : ''
  end

  def toonflags
    build.without?('toon') ? '--without-toon' : ''
  end

  def ffmpegflags
    build.without?('ffmpeg') ? '--without-ffmpeg' : '--enable-gpl'
  end

  def libpngflags
    build.without?('libpng') ? '--without-png' : ''
  end

  def libjpegflags
    build.without?('libjpeg') ? '--without-jpeg' : ''
  end

  def libtiffflags
    build.without?('libtiff') ? '--without-tiff' : ''
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          x11flags, toonflags, ffmpegflags, libpngflags, libjpegflags, libtiffflags

    system "make", "install"
  end

end
