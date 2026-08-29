class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.7.0/meetily-memory-v0.7.0-macos-arm64.tar.gz"
      sha256 "4961ceb31c8aa9421e8cdba12da4cf6548053b71f316e0fec1abda466883ad0e"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.7.0/meetily-memory-v0.7.0-macos-x86_64.tar.gz"
      sha256 "bc95aa31ab3fe0333d6b0a5e36302f673df65be790ff6d5cdd0a79407ec6aeb3"
    end
  end

  def install
    libexec.install Dir["*"]

    bin.install_symlink libexec/"mm" => "mm"
    bin.install_symlink libexec/"mm" => "meetily-memory"
  end

  test do
    system bin/"mm", "--help"
  end
end
