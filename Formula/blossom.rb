class Blossom < Formula
  desc "AI conversational language learning app for Japanese, Chinese, and Korean"
  homepage "https://github.com/wu-json/blossom"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_darwin_arm64.tar.gz"
      sha256 "6414c476f3330121b1d6b4abf1af2b242d8b8af352a2e1fca85af0620f16739c"
    end
    on_intel do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_darwin_amd64.tar.gz"
      sha256 "7f03c10aaa49a68a0a6079a8d75faad9fbf1f5bae7944a1183fb5ff108171696"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_linux_arm64.tar.gz"
      sha256 "827101faa7d77ce498485482c53ed66ca298e68933ba8c6841ab79895fadb8cd"
    end
    on_intel do
      url "https://github.com/wu-json/blossom/releases/download/v#{version}/blossom_#{version}_linux_amd64.tar.gz"
      sha256 "f0cb9e8feab62e1ba72f6b802d0927fa357e3cbc18f1822f0eda89ddd47562a1"
    end
  end

  def install
    bin.install "blossom"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blossom --version")
  end
end
