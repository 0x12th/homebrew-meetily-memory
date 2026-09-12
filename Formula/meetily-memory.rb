class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.8.7/meetily-memory-v0.8.7-macos-arm64.tar.gz"
      sha256 "42f7aab75e6778cf031f277943f2d5d4f7cf5cd5ab328d74edd89c86278251fc"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.8.7/meetily-memory-v0.8.7-macos-x86_64.tar.gz"
      sha256 "c01501685ac3798893d077a28946db8723210e21f7d599fc452bc0952f596fa9"
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
