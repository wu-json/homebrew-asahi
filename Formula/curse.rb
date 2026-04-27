class Curse < Formula
  desc "Dead simple Terminal UI for running processes"
  homepage "https://github.com/wu-json/curse"
  version "0.0.25"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_arm64.tar.gz"
      sha256 "0d9f24066487b102909ed5aee51d53d370ba85f54ac0d8be20251971b056849c"
    end
    on_intel do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_amd64.tar.gz"
      sha256 "1535e81a56986949e4491ca636df3c0ab06a329616880f7554cf4f0167618b3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_arm64.tar.gz"
      sha256 "10808fe3c63c01d6b6d2e512378b788963d27a8a8db1813d9a4ce6b331840d54"
    end
    on_intel do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_amd64.tar.gz"
      sha256 "39dd9df8d0ed06fec09a5c37f2cc25501fbd641aa4aba8710ba48bb69e01b86e"
    end
  end

  def install
    bin.install "curse"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/curse --version")
  end
end
