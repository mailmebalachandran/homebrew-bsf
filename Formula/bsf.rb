class Bsf < Formula
    desc "This tool search the pattern including the sub directories for the given path"
    homepage "https://github.com/mailmebalachandran/homebrew-bsf"
    url "https://github.com/mailmebalachandran/homebrew-bsf/archive/v0.1.0.tar.gz"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    license "MIT OR Apache-2.0 "
  
    depends_on "rust" => :build
  
    def install
      system "cargo", "install", "--root", prefix, "--path", "."
    end
  
    test do
      system "#{bin}/bsf", "--version"
    end
  end