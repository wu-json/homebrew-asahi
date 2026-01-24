class Blossom < Formula
  desc "AI conversational language learning app for Japanese, Chinese, and Korean"
  homepage "https://github.com/wu-json/blossom"
  version "0.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_darwin_arm64.tar.gz"
      sha256 "8f6715278a4faec5982a3b23c6b394d8bea812fd07ad555cdd0c5be69b74758f"
    end
    on_intel do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_darwin_amd64.tar.gz"
      sha256 "da0fdee2bd8c89076047f70bd23df94c60681b6a0467c207669f39fa999c5af9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_linux_arm64.tar.gz"
      sha256 "eebea0685a13e1c7519518fe609695cf9cf06ce24d440a1958906b35bf871cb5"
    end
    on_intel do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_linux_amd64.tar.gz"
      sha256 "0b672655b6e03957ace973cd27444cfb0d8dfea678f6487687e638ac1a6507c2"
    end
  end

  def install
    bin.install "blossom"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blossom --version")
  end
end
