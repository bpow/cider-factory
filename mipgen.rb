class Mipgen < Formula
  desc "Designer of custome mip panels for DNA target enrichment"
  homepage "https://shendurelab.github.io/MIPGEN/"
  url "https://github.com/shendurelab/MIPGEN/archive/v1.1.tar.gz"
  sha256 "e8062e8cc0c7844ee363c6d17555df58db022dbe47d34d0ab00626cbc4c56e46"
  head "https://github.com/shendurelab/MIPGEN.git"

  def install
    system "make"

    bin.install "mipgen"

    if File.exist? "LICENSE.txt"
      doc.install "LICENSE.txt"
    end
    doc.install "README.md"
    doc.install "BOOST_LICENSE_1_0.txt"
    doc.install "tools"
  end

  test do
    system "#{bin}/mipgen"
  end
end
