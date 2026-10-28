class AlfyClean < Formula
  desc "macOS helper that cleans Xcode, simulator and developer caches"
  homepage "https://github.com/vilapuigvila/alfy-clean"
  url "https://github.com/vilapuigvila/alfy-clean/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "caf8e6aed3e0e627baead10d6f8eb5e488c17e537d119789cc1f908e1a9e70aa"
  head "https://github.com/vilapuigvila/alfy-clean.git", branch: "development"

  depends_on macos: :monterey
  depends_on xcode: ["13.0", :build]

  def install
    # Homebrew already runs builds in a sandbox, so SwiftPM's own sandbox must be off.
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/alfy-clean"
  end

  test do
    assert_match "alfy-clean version #{version}", shell_output("#{bin}/alfy-clean --version")
  end
end
