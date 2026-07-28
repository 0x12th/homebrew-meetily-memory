class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.5.0/meetily-memory-v0.5.0-macos-arm64.tar.gz"
      sha256 "108d58d3157879ca7e07b1e77d6576aaa18dfba48fc42d7098345dc0ffb85fea"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.5.0/meetily-memory-v0.5.0-macos-x86_64.tar.gz"
      sha256 "e31d57a65d4d693ae16cbf8c94d2e051e550bf972d2bba9a70a1d7db107bd5cf"
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
