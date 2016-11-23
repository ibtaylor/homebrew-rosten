require 'formula'

class Gvars < Formula
  homepage 'http://www.edwardrosten.com/cvd/gvars3.html'
  url 'http://www.edwardrosten.com/cvd/gvars-3.0.tar.gz'
  sha256 'fc051961d4da5dce99a20f525dc1e98368f7283aed7b20e68ffb35e34ac3f5fa'
  head 'https://github.com/edrosten/gvars.git'

  depends_on :x11
  depends_on 'toon' => :recommended
  depends_on 'fltk' => :optional
  depends_on 'readline'

  option :universal

  def x11flags
    build.with?('x11') ? '--with-x' : ''
  end

  def toonflags
    build.with?('toon') ? '--with-TooN' : ''
  end

  def fltkflags
    build.without?('fltk') ? '--disable-fltk' : ''
  end

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--prefix=#{prefix}", x11flags, toonflags, fltkflags
    system "make", "install"
  end
end
