class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.4.0/meetily-memory-v0.4.0-macos-arm64.tar.gz"
      sha256 "2c54d86a261a6ade796c695121dd0aa3ef9fd91acbb214cf688f023a15181909"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.4.0/meetily-memory-v0.4.0-macos-x86_64.tar.gz"
      sha256 "1af35ea0d6934e6df5f70fa9e17ed02346de8f5b4505adf96e05d16542ed00a2"
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
