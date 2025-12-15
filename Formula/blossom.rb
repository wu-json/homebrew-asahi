class Blossom < Formula
  desc "AI conversational language learning app for Japanese, Chinese, and Korean"
  homepage "https://github.com/wu-json/blossom"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_darwin_arm64.tar.gz"
      sha256 "990c032e032187b2cd09d816fa58ddd0e12f8f2222250f2761d5c4f52dd456a6"
    end
    on_intel do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_darwin_amd64.tar.gz"
      sha256 "5c9dce3a4d74d012e6fe116c7a41e8f34e6a81a972248a1606b621767709116f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_linux_arm64.tar.gz"
      sha256 "8d4ccb69285290b7a221093a6cf0ccecd33bfdf82f18a280bbabf2fad39446f3"
    end
    on_intel do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_linux_amd64.tar.gz"
      sha256 "b2601752205c76d240110e7d7c576e6df4be26b11f8a1724e0b123c28c433ad6"
    end
  end

  def install
    bin.install "blossom"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blossom --version")
  end
end
