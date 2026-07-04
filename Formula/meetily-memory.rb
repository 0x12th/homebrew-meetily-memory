class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  version "0.2.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.2.0/meetily-memory-v0.2.0-macos-arm64.tar.gz"
      sha256 "8d67f6a57ab3ed0bebc6c297ad02cc687be2dd569dc4684690a3d251fc6eae1c"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.2.0/meetily-memory-v0.2.0-macos-x86_64.tar.gz"
      sha256 "3a2d690b20db88ed62603e9fc863abab6e56f7c6dc8fa354a8d6f6166e0c4d2a"
    end
  end

  def install
    bin.install "mm"
    bin.install_symlink "mm" => "meetily-memory"
  end

  test do
    system bin/"mm", "--help"
  end
end
