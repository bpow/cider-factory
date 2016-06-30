class Vt < Formula
  desc "tools for dealing with genomic variant VCF files"
  homepage "https://github.com/atks/vt"
  url "https://github.com/atks/vt/archive/39f8680.tar.gz"
  version "2016-06-02"
  sha256 "d66a5377b33e62a37bad904e7ada6e292cc14abd0592086c232436f9511500cc"

  def install
    inreplace "paste_and_compute_features_sequential.cpp", " isnan", " std::isnan"
    inreplace "paste_genotypes.cpp", " isnan", " std::isnan"
    system "make"
    bin.install "vt"
  end

  test do
    system "vt"
  end
end
