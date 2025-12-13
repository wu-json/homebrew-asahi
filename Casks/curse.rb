cask "curse" do
  version "0.0.18"
  sha256 arm:   "85905202061a0e596ba4dafe618d2bd34704b08ddf1005939e73bfb5cbc6a0bc",
         intel: "4db112dd042588334345b798896b9ff7a2d10a231b20505dee73c10c9fd4b587"

  url "https://github.com/wu-json/curse/releases/download/v#{version}/curse_#{version}_darwin_#{Hardware::CPU.intel? ? "amd64" : "arm64"}.tar.gz"
  name "Curse"
  desc "Dead simple Terminal UI for running processes"
  homepage "https://github.com/wu-json/curse"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "curse"
end
