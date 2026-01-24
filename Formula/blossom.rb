class Blossom < Formula
  desc "AI conversational language learning app for Japanese, Chinese, and Korean"
  homepage "https://github.com/wu-json/blossom"
  version "0.0.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_darwin_arm64.tar.gz"
      sha256 "417150c59909676a6994f4d05e906153caedba76430097df8022f4d954c8fb2e"
    end
    on_intel do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_darwin_amd64.tar.gz"
      sha256 "4c0ea999ba7f4b9ed430ba309191688c8291487f1cf6e139c18a6b2ac5ce7a67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_linux_arm64.tar.gz"
      sha256 "13c713a6bbc65ded61a049bd21ca0e02af511ae43ba46e71ee3f025bb77969d5"
    end
    on_intel do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_linux_amd64.tar.gz"
      sha256 "c3964f2f96acac84b51af965c0b3ff77a4b8db376b3d62303d850dc3de2240e8"
    end
  end

  def install
    bin.install "blossom"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blossom --version")
  end
end
