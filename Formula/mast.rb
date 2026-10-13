class Mast < Formula
  desc "Terminal UI that shows every coding agent running on your machine"
  homepage "https://github.com/wu-json/mast"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/mast/releases/download/v0.1.1/mast_0.1.1_darwin_arm64.tar.gz"
      sha256 "f175c00de0f41593b49a37546babae8758a413daa9dc1051cb21d42a989c1bf0"
    end
    on_intel do
      url "https://github.com/wu-json/mast/releases/download/v0.1.1/mast_0.1.1_darwin_amd64.tar.gz"
      sha256 "08acaae4516b7b4da7e1ad8686cc72f6164f2a703d795077635c9fb716a7339e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/mast/releases/download/v0.1.1/mast_0.1.1_linux_arm64.tar.gz"
      sha256 "caa03679590a7c9c377b4eda26cac47e83eb5eef7a8fdfff70258c50688f92d4"
    end
    on_intel do
      url "https://github.com/wu-json/mast/releases/download/v0.1.1/mast_0.1.1_linux_amd64.tar.gz"
      sha256 "5a9f2185da0e37fc8558d4beec217ea8be3bbfc7fc0a52c183239fb7aca2abf9"
    end
  end

  def install
    bin.install "mast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mast --version")
  end
end
