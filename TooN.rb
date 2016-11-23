require 'formula'

class Toon < Formula
  homepage 'http://www.edwardrosten.com/cvd/toon.html'
  url 'https://github.com/edrosten/TooN/archive/TOON_2.1.zip'
  sha256 '4b53695e4dd7c0e94eda1c3919b061a99c92bf5430f2668b43778799712b26cb'
  head 'https://github.com/edrosten/TooN.git'

  def install
    system "./configure", "--disable-debug",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}"
    system "make", "install"
  end

end
