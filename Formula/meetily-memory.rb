class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.8.0/meetily-memory-v0.8.0-macos-arm64.tar.gz"
      sha256 "87d3f3301bc0ca1167ec82c662c663c0d97f5de23706f4317eec3593d4e43c9a"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.8.0/meetily-memory-v0.8.0-macos-x86_64.tar.gz"
      sha256 "14603ec93c3f4ddb5ee327099534c0838924b1a0156bfb28efaf6212439242fb"
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
