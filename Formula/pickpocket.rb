class Pickpocket < Formula
  desc "Vendor git repos as local LLM context for your coding agents"
  homepage "https://github.com/wu-json/pickpocket"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_darwin_arm64.tar.gz"
      sha256 "34f11531a7d465d8d4b4ff34ed53c0f66386ab8890f1fd6f336811488cc8810b"
    end
    on_intel do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_darwin_amd64.tar.gz"
      sha256 "92ec913dc09a2f068297f14535ef7d44cbb2babf85ec2e258161b87720946e59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_linux_arm64.tar.gz"
      sha256 "9bd7c25237e2d340636af917876e54bf290c8401709d35e01d39479f5e9ea97d"
    end
    on_intel do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_linux_amd64.tar.gz"
      sha256 "181d973593a0d3cc676ac07397acea77faaa0a3d99799af93ee699bca0e6bc3e"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pick --version")
  end
end
