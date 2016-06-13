require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2016-06-02'
  url "https://github.com/atks/vt/archive/39f8680.tar.gz"
  sha1 "6e159d1f1b5240ebc683187badc75e94da43e805"

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
