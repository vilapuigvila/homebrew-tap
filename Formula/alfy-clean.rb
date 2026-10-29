class AlfyClean < Formula
  desc "macOS helper that cleans Xcode, simulator and developer caches"
  homepage "https://github.com/vilapuigvila/alfy-clean"
  url "https://github.com/vilapuigvila/alfy-clean/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "604ee34fd9400de46442e3586014a640b0cf8a0e253341e1fea669f75ed79550"
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
