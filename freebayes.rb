# based on https://github.com/chapmanb/homebrew-cbl

class RecursiveGitDownloadStrategy < GitDownloadStrategy
  def clone_args
    args = %w[clone]
    args << "--recursive"
    args << @url << @clone
  end

  def stage
    cp_r Dir[@clone+"{.}"], Dir.pwd
    checkout
  end

  def repo_valid?
    false
  end

  def submodules?
    false
  end
end

class Freebayes < Formula
  desc "Bayesian genetic variant detector"
  homepage "https://github.com/ekg/freebayes"
  url "https://github.com/ekg/freebayes.git", :using => RecursiveGitDownloadStrategy, :rev => "41c1313c4a5cb361cd96771064e9b19f07a6824e"
  version "1.0.2-41c1313"
  head "https://github.com/ekg/freebayes.git", :using => RecursiveGitDownloadStrategy

  depends_on "cmake" => :build
  depends_on "parallel"

  def install
    ENV.deparallelize
    # Build fix: https://github.com/chapmanb/homebrew-cbl/issues/14
    if OS.mac?
      inreplace "vcflib/smithwaterman/Makefile" do |s|
        s.sub! "LDFLAGS=-Wl,-s", "LDFLAGS=-Wl,-v"
      end
    end
    mkdir "bamtools/build" do
      system "cmake", "..", *std_cmake_args
      system "make"
    end
    cd "src" do
      system "make", "autoversion"
    end
    system "make"

    bin.install "bin/freebayes"
    bin.install "bin/bamleftalign"

    bin.install "scripts/freebayes-parallel"

    bin.install "scripts/fasta_generate_regions.py"

    # this script uses "env" alreayd, no need to fix
    bin.install "scripts/coverage_to_regions.py"

    bin.install "scripts/generate_freebayes_region_scripts.sh"

    doc.install "README.md"
    doc.install "LICENSE"
  end

  test do
    system "#{bin}/freebayes", "--version"
    system "#{bin}/freebayes-parallel"
    system "#{bin}/fasta_generate_regions.py"
    system "#{bin}/coverage_to_regions.py"
  end
end
