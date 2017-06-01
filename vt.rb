class Vt < Formula
  desc "tools for dealing with genomic variant VCF files"
  homepage "https://github.com/atks/vt"
  url "https://github.com/atks/vt/archive/6686b5c.tar.gz"
  version "2017-05-08"
  sha256 "659d1ab83d404b4dbb58c547bfb0c42d168ddfb518bab9fa7af9ab78c25f700f"

  def install
    system "make"
    bin.install "vt"
  end

  test do
    system "vt"
  end
end
