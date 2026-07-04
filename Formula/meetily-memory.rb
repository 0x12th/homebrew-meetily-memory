class MeetilyMemory < Formula
  desc "Local-first Meetily history index and CLI"
  homepage "https://github.com/0x12th/meetily-memory"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.1.0/meetily-memory-v0.1.0-macos-arm64.tar.gz"
      sha256 "3ba6252add257c708dd7f1b6598dfbb17bab9771b7a6fc9f40c2822b34cf4865"
    elsif Hardware::CPU.intel?
      url "https://github.com/0x12th/meetily-memory/releases/download/v0.1.0/meetily-memory-v0.1.0-macos-x86_64.tar.gz"
      sha256 "1118c3b6b5ec59111c2b3e7b21a8d3bfa20c3f951f8104c1a279835854fa4c7d"
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
