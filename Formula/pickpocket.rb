class Pickpocket < Formula
  desc "Vendor git repos as local LLM context for your coding agents"
  homepage "https://github.com/wu-json/pickpocket"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_darwin_arm64.tar.gz"
      sha256 "9c3da162355a3b70f34a6c9a867d981e47d3d4e0501a7536949c08ca9c8507c9"
    end
    on_intel do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_darwin_amd64.tar.gz"
      sha256 "75562fca1dfd05b205a37cf66e4e82f91f2896a0aedef8e48cb94762ff99a28d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_linux_arm64.tar.gz"
      sha256 "0a06126cad826049c1aff9f2686d106d993fcfe216a38ab452a957d5f7a27897"
    end
    on_intel do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_linux_amd64.tar.gz"
      sha256 "13d2335d701fb77fec3190ba67d9ec2b2c2d962a8e79f15e6f47be0bfc8bc31f"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pick --version")
  end
end
