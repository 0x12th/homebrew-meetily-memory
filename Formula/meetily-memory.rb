class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.4.1/meetily-memory-v0.4.1-macos-arm64.tar.gz"
      sha256 "39a62ae66302f1a760f51b9829442eac0ce617e96106d7d16d002fcd3cd92e23"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.4.1/meetily-memory-v0.4.1-macos-x86_64.tar.gz"
      sha256 "ea8be595de54d37e3ad4f5c5193842fe9b74ab526e54ac1840ab02b09a9dbde2"
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
