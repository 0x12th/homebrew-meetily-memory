class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.8.6/meetily-memory-v0.8.6-macos-arm64.tar.gz"
      sha256 "526e2960d38c2b2e2bb4b335d75d73c50dc387562e2686fb6d6b7789ba4d7273"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.8.6/meetily-memory-v0.8.6-macos-x86_64.tar.gz"
      sha256 "c32b0702dbe8aad977fc16dba17e3fb97d4c8e4095dff10bc640db36495e8301"
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
