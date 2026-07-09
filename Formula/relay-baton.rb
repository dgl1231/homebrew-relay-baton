class RelayBaton < Formula
  desc "Token-aware handoff harness for Codex CLI and Claude Code"
  homepage "https://github.com/dgl1231/relay-baton"
  version "1.2.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.2.0/relay-baton-macos-arm64"
    sha256 "b34132ffb213f5f67f099da1438cbf28b9ac63218a1e4f5bb7d6e298f404bcce"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.2.0/relay-baton-linux-x64"
    sha256 "f48a4a088d61e3cc14ecd93ea1268bfcc55bc95f34864a7b731708c73e9324be"
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
