class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.3.0/meetily-memory-v0.3.0-macos-arm64.tar.gz"
      sha256 "7c50d0cf3ede04cf6452c9cf3ed9ff5b602115da809373159c369a25d9b93ee6"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.3.0/meetily-memory-v0.3.0-macos-x86_64.tar.gz"
      sha256 "9830dbe732a0d4bcfba24d4299ffbd25d6f645d856dab4b7515cc1eb487d4cd2"
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
