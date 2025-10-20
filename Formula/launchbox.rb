class Launchbox < Formula
  # Homebrew formulas values are hardcoded and the reason
  # is due to how Homebrew’s DSL (domain-specific language in Ruby)
  # and its formula system are designed and parsed
  desc "Teenage Guide to Popularity command-line interface for creating boilerplate Next.js application."
  homepage "https://github.com/fabiomrosa/homebrew-launchbox"
  license "MIT"
  version "0.5.3"

  on_macos do
    on_arm do
      url "https://github.com/fabiomrosa/homebrew-launchbox/releases/download/v#{version}/launchbox-darwin-arm64"
      sha256 "7534df86f245274d68191cf7eda6c87b720abed744d8becbe5b3cb89c2739c23"
    end

    on_intel do
      url "https://github.com/fabiomrosa/homebrew-launchbox/releases/download/v#{version}/launchbox-darwin-amd64"
      sha256 "b3d9816cf71bdc5e0326769bbde06cb807a0c3e179581441777ca6a5166cf244"
    end
  end

  def install
    binary = if Hardware::CPU.arm?
      "launchbox-darwin-arm64"
    else
      "launchbox-darwin-amd64"
    end

    bin.install binary => "launchbox"
  end

  test do
    assert_match "launchbox", shell_output("#{bin}/launchbox --help")
  end
end
