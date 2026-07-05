class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.3.1/meetily-memory-v0.3.1-macos-arm64.tar.gz"
      sha256 "804dd2920d470b8dece8f131686c5908e5692fba2acdbec6cb2d3d30e4fa1835"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.3.1/meetily-memory-v0.3.1-macos-x86_64.tar.gz"
      sha256 "00880e9366720455a3194004c7159c43dedff025c3dd45672a0ea55b3cc5fa5b"
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
