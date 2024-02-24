class Bsf < Formula
    desc "This tool search the pattern including the sub directories for the given path"
    homepage "https://github.com/mailmebalachandran/homebrew-bsf"
    url "https://github.com/mailmebalachandran/homebrew-bsf/archive/v0.1.2.tar.gz"
    sha256 "e9cb879d7378a82a07eecc775caac00bd532f14774c4ad883e968d1f016d852e"
    license "MIT OR Apache-2.0 "
  
    depends_on "rust" => :build
  
    def install
      system "cargo", "install", "--root", prefix, "--path", "."
    end
  
    test do
      system "#{bin}/bsf", "--version"
    end
  end