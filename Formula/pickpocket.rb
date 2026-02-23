class Pickpocket < Formula
  desc "Vendor git repos as local LLM context for your coding agents"
  homepage "https://github.com/wu-json/pickpocket"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_darwin_arm64.tar.gz"
      sha256 "ab0271ebbff46fee7591e8d07451f3eab40d9f1e3a19e42725c4321acda316d0"
    end
    on_intel do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_darwin_amd64.tar.gz"
      sha256 "d7d86d231cb679ce3a8763e1667747aba27acfa89432a7698ef55327f5681bb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_linux_arm64.tar.gz"
      sha256 "6c5bfde32f28d51ab2d35a136fc8252fca9b4dbd46b5ecedb3b0ec3d3b12d505"
    end
    on_intel do
      url "https://github.com/wu-json/pickpocket/releases/download/v#{version}/pickpocket_#{version}_linux_amd64.tar.gz"
      sha256 "db1f4e3a514d2ed15e17def42a733d1941361326d67a89d308096b42dd8bec3f"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pick --version")
  end
end
