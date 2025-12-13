class Curse < Formula
  desc "Dead simple Terminal UI for running processes"
  homepage "https://github.com/wu-json/curse"
  version "0.0.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_arm64.tar.gz"
      sha256 "49b1b003b481543444de2831a127a5f93899273501d08c768c458a818ee909a5"
    end
    on_intel do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_amd64.tar.gz"
      sha256 "50537bd829c055ef6171aa89fbb5e086e0832e62e05785322f20a2d66c7fe3a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_arm64.tar.gz"
      sha256 "914340d033ac4abfd2846458dc333c2de2d4e27593ab388b01e9be0b0771d747"
    end
    on_intel do
      url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_linux_amd64.tar.gz"
      sha256 "a46a5552169b4dd1c0faef471a10572644f861d5f68a0a7b47a409e20681bf6a"
    end
  end

  def install
    bin.install "curse"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/curse --version")
  end
end
