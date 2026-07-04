class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.2.1/meetily-memory-v0.2.1-macos-arm64.tar.gz"
      sha256 "4c4d6be8cd6c6eb55222e155fe5cc70369a37fae4a1f539edaaa021ec156f31f"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.2.1/meetily-memory-v0.2.1-macos-x86_64.tar.gz"
      sha256 "eab11b649bff9258c60bb94d8ef1721a4ec8f1eae3edba5caa3e843457fd679d"
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
