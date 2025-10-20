class Launchbox < Formula
  # Homebrew formulas values are hardcoded and the reason
  # is due to how Homebrew’s DSL (domain-specific language in Ruby)
  # and its formula system are designed and parsed
  desc "Teenage Guide to Popularity command-line interface for creating boilerplate Next.js application."
  homepage "https://github.com/fabiomrosa/homebrew-launchbox"
  license "MIT"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/fabiomrosa/homebrew-launchbox/releases/download/v#{version}/launchbox-darwin-arm64"
      sha256 "9f41444180a1f0de9e60843c1be0df34e033c5fcfa79484043b89fec9f6f53aa"
    end

    on_intel do
      url "https://github.com/fabiomrosa/homebrew-launchbox/releases/download/v#{version}/launchbox-darwin-amd64"
      sha256 "fd66c386daea2457bb994a23fc1ef97a23fbb1049a917fbb027316dbe241fd0f"
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
