class Curse < Formula
  desc "Dead simple Terminal UI for running processes"
  homepage "https://github.com/wu-json/curse"
  version "0.0.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_arm64.tar.gz"
      sha256 "94af9c82dfc5169d74e29a6b89bb027b64d33b60beb2ba5ac1c80e530016af3a"
    end
    on_intel do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_amd64.tar.gz"
      sha256 "99df1a14bc30815b485f26355cd4ceaa2d84ce80f8f9934818d83ca43b6269b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_arm64.tar.gz"
      sha256 "5e60119ac27dbefc29c74d66c78abd785475bcc5f5c6708ed4f8a12cb6b75df7"
    end
    on_intel do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_amd64.tar.gz"
      sha256 "e0655fb2503d83d804aa8768c9fdc2c52bcb950bd23c629c20cab6728f9ec72d"
    end
  end

  def install
    bin.install "curse"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/curse --version")
  end
end
