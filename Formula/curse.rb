class Curse < Formula
  desc "Dead simple Terminal UI for running processes"
  homepage "https://github.com/wu-json/curse"
  version "0.0.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_arm64.tar.gz"
      sha256 "4d029eaf391097f9a606bab1a922c6fd43d7454317fcc9e7e94ceb536dfc8813"
    else
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_amd64.tar.gz"
      sha256 "0811d948d9dfe7cff6b174de829ccedd838eb17b18ca85e9e9a9e6cd3c8330f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_arm64.tar.gz"
      sha256 "cadf0ef29757bbe0be841731724c73eb692285b2e0fdb3439a7db85c34c8956d"
    else
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_amd64.tar.gz"
      sha256 "4bb1195a00619d4340fede91b66be6eb1f29651b4fc98fce56d0cbf4a522dd25"
    end
  end

  def install
    bin.install "curse"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/curse --version")
  end
end
