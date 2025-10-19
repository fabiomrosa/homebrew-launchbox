class Launchbox < Formula
  # Homebrew formulas values are hardcoded and the reason
  # is due to how Homebrew’s DSL (domain-specific language in Ruby)
  # and its formula system are designed and parsed
  desc "Teenage Guide to Popularity command-line interface for creating boilerplate Next.js application."
  homepage "https://github.com/fabiomrosa/launchbox"
  license "MIT"
  version "0.2.7"

  on_macos do
    on_arm do
      url "https://github.com/fabiomrosa/homebrew-launchbox/releases/download/v#{version}/launchbox-darwin-arm64"
      sha256 "48a1ee0ab42f405d392c85b5ab605c5bdd938dc1c99be06dce83af5109aea978"
    end

    on_intel do
      url "https://github.com/fabiomrosa/homebrew-launchbox/releases/download/v#{version}/launchbox-darwin-amd64"
      sha256 "7689f32e841e7c99eecb593ee8c5f61aeadc0c9aeabf31a1523ed634691eeddc"
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
