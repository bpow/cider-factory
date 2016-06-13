require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2016-06-02'
  url "https://github.com/atks/vt/archive/39f8680.tar.gz"
  sha256 "d66a5377b33e62a37bad904e7ada6e292cc14abd0592086c232436f9511500cc"

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
