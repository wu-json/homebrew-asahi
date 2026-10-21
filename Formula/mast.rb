class Mast < Formula
  desc "Terminal UI that shows every coding agent running on your machine"
  homepage "https://github.com/wu-json/mast"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wu-json/mast/releases/download/v0.2.1/mast_0.2.1_darwin_arm64.tar.gz"
      sha256 "8a983d593bba095aacc2c5ffdf1010751dd23bea541a0e8dd4b98937ef6f7026"
    end
    on_intel do
      url "https://github.com/wu-json/mast/releases/download/v0.2.1/mast_0.2.1_darwin_amd64.tar.gz"
      sha256 "b78569da870f243062809a374bf7c1afbf3cb942cbf0e161c2fb2e1f9405e04f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wu-json/mast/releases/download/v0.2.1/mast_0.2.1_linux_arm64.tar.gz"
      sha256 "f86c645bf6fb27215e320642d8c74f0ea266f07edd9775f3d2843f6ea683464a"
    end
    on_intel do
      url "https://github.com/wu-json/mast/releases/download/v0.2.1/mast_0.2.1_linux_amd64.tar.gz"
      sha256 "eadf2378d0a89416c9e8b1d71debabf8aa84ddb42e27278478bc6d638f7b758c"
    end
  end

  def install
    bin.install "mast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mast --version")
  end
end
