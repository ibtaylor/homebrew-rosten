require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Tag < Formula
  homepage ''
  url 'http://www.edwardrosten.com/cvd/tag-20090724.tar.gz'
  sha256 '44941a71a68eadf41246bdd5a0f54092f14119980964b28a25467a7c79ace3f8'

  depends_on 'TooN' 

  def install
    system "./configure", "--prefix=#{prefix}"
    system "chmod", "+x", "install-sh"
    system "make", "install" # if this fails, try separate make/make install steps
  end
end
