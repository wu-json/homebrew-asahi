class Pickpocket < Formula
  desc "Vendor git repos as local LLM context for your coding agents"
  homepage "https://github.com/wu-json/pickpocket"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_darwin_arm64.tar.gz"
      sha256 "fecdfbbdf99112cf38d1b2cd090ff0c45984253bb47b12caded6c54a6f26afca"
    end
    on_intel do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_darwin_amd64.tar.gz"
      sha256 "1c96889b72ecd7a8d67b599288093c65584b27a6e12dcc6af1a394baf25ca1ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_linux_arm64.tar.gz"
      sha256 "c39e3b0acf828c0b58e80740817a6c86181572a623110b55c5b6449006cc73e1"
    end
    on_intel do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_linux_amd64.tar.gz"
      sha256 "d606b4414ad85478a052b7013f9308b7f3d2e22ee64ddbdffecab5207f92b2e5"
    end
  end

  def install
    bin.install "pickpocket"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pickpocket --version")
  end
end
