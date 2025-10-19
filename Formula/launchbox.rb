class Launchbox < Formula
  # Homebrew formulas values are hardcoded and the reason
  # is due to how Homebrew’s DSL (domain-specific language in Ruby)
  # and its formula system are designed and parsed
  desc "Teenage Guide to Popularity command-line interface for creating boilerplate Next.js application."
  homepage "https://github.com/fabiomrosa/launchbox"
  license "MIT"
  version "0.3.4"

  on_macos do
    on_arm do
      url "https://github.com/fabiomrosa/homebrew-launchbox/releases/download/v#{version}/launchbox-darwin-arm64"
      sha256 "0e91ad4c4fb153377f22abfa2cea2f50a4ca8602f6a28d66be11d679c46fd1dd"
    end

    on_intel do
      url "https://github.com/fabiomrosa/homebrew-launchbox/releases/download/v#{version}/launchbox-darwin-amd64"
      sha256 "359cd3cf959cf3b721734463f8ac5842cd368244e652ceba2261ee3eada13155"
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
