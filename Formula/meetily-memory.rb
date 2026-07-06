class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.3.2/meetily-memory-v0.3.2-macos-arm64.tar.gz"
      sha256 "7b569982b9224fc084267ba43e9e417c44e50d7da37e7b9ae6d4128bdfb3aa82"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.3.2/meetily-memory-v0.3.2-macos-x86_64.tar.gz"
      sha256 "805d17c0ea0263f0783fb1c41e6624ad241c244b8d80152feec1ca9cd5ca2406"
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
