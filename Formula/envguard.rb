class Envguard < Formula
  desc "A lightweight CLI to keep your .env files honest"
  homepage "https://github.com/BLemine/envguard"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BLemine/envguard/releases/download/v0.3.0/envguard-darwin-arm64"
      sha256 "25bc7bd1bc699e2a235512e5024ac3542f2543ec41c94a4dd6e89fa023de733a"
    else
      url "https://github.com/BLemine/envguard/releases/download/v0.3.0/envguard-darwin-amd64"
      sha256 "ca4fa6f4888d7e82d9b45c05575c761c9cdfd9c2bf32c1ad9d4e34f57b6a35c7"
    end
  end

  on_linux do
    url "https://github.com/BLemine/envguard/releases/download/v0.3.0/envguard-linux-amd64"
    sha256 "63e8f18267175da2109796ca70a004b77f31f50dded9134be5f70daff7f88263"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "envguard-darwin-arm64" => "envguard"
    elsif OS.mac?
      bin.install "envguard-darwin-amd64" => "envguard"
    else
      bin.install "envguard-linux-amd64" => "envguard"
    end
  end

  test do
    system "#{bin}/envguard", "--help"
  end
end
