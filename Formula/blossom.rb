class Blossom < Formula
  desc "AI conversational language learning app for Japanese, Chinese, and Korean"
  homepage "https://github.com/wu-json/blossom"
  version "0.0.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_darwin_arm64.tar.gz"
      sha256 "7bab8ab8831339d303883c7542c51cf514e2e87387f10fbeb90d93acd85700e6"
    end
    on_intel do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_darwin_amd64.tar.gz"
      sha256 "6add60e47a33f97aa2fa7676698279be40390a82e0a8a1c56242dad4a974335d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_linux_arm64.tar.gz"
      sha256 "6ba96d71f5d2c8e0aa3449b37c1051d07f08bec208ba5b3e45d03a39332728e0"
    end
    on_intel do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_linux_amd64.tar.gz"
      sha256 "57c57990e5cc21e7e08efdd0fd1a67cbcb7c5c92b5d8cc139119e10280004b18"
    end
  end

  def install
    bin.install "blossom"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blossom --version")
  end
end
