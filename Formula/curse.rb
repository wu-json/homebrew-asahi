class Curse < Formula
  desc "Dead simple Terminal UI for running processes"
  homepage "https://github.com/wu-json/curse"
  version "0.0.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_arm64.tar.gz"
      sha256 "093a741a5da7068f0531cbabff2337a304bfeb0725fcf6781989915f9e2665e1"
    end
    on_intel do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_amd64.tar.gz"
      sha256 "8e1e6ff469d2294fa971d657577d6f32f3f11a857af10113a698e100d58e1458"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_arm64.tar.gz"
      sha256 "3dbe131e228a989e109f95e47b656005f2e49b637d4d7ffbf8e53e12d5841d95"
    end
    on_intel do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_amd64.tar.gz"
      sha256 "906522fe19676d8d906fe9f202e09eee74e2d63939d09f8a2328860239f83fb9"
    end
  end

  def install
    bin.install "curse"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/curse --version")
  end
end
