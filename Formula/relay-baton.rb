class RelayBaton < Formula
  desc "Token-aware handoff harness for Codex CLI and Claude Code"
  homepage "https://github.com/dgl1231/relay-baton"
  version "1.4.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.4.1/relay-baton-macos-arm64"
    sha256 "2f1a3b1f4b5840e400df68b0e8e5f4c7dcc70673da0e30f3685588869ad1c2e7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.4.1/relay-baton-linux-x64"
    sha256 "526d3da8338d537cbd3e1f0f1b5219fcaf3bbf73e61bb40373d25b2f61518b9f"
  else
    odie "relay-baton prebuilt Homebrew formula supports macOS arm64 and Linux x64"
  end

  def install
    bin.install Dir["relay-baton-*"].first => "relay-baton"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/relay-baton --version")
  end
end
