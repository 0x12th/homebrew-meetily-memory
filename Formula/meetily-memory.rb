class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.6.0/meetily-memory-v0.6.0-macos-arm64.tar.gz"
      sha256 "cc1cd369a81d35011e8bebb6793d6a43fe4aa281d08fe92e73a8accab982bea8"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.6.0/meetily-memory-v0.6.0-macos-x86_64.tar.gz"
      sha256 "41a9120029bc103596068e2acfa6c123d04f6732308b86aea05c5110eb3579ad"
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
