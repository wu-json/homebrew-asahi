class Curse < Formula
  desc "Dead simple Terminal UI for running processes"
  homepage "https://github.com/wu-json/curse"
  version "0.0.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_arm64.tar.gz"
      sha256 "3687d4a4984f6a0c3d4ded18a63f7145b522eecdca9855e2536c7c186282b3f8"
    end
    on_intel do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_amd64.tar.gz"
      sha256 "ded2f581e20e55005a3f3121c1954269327c7c17f4bd7b157b1fa819cdb44e68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_arm64.tar.gz"
      sha256 "7e2be2206d2ed85fe9308ca8b78c219900465bdcfce9a7761b48d7bc447237fe"
    end
    on_intel do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_amd64.tar.gz"
      sha256 "6f9bf6ab8a6c5fc262d36f240a4190a25fad955c3a89ae556afbbd13bfd59a86"
    end
  end

  def install
    bin.install "curse"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/curse --version")
  end
end
