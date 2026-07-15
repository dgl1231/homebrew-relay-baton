class RelayBaton < Formula
  desc "Token-aware handoff harness for Codex CLI and Claude Code"
  homepage "https://github.com/dgl1231/relay-baton"
  version "1.4.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.4.0/relay-baton-macos-arm64"
    sha256 "e1684e956255e0e19264802631fc9b85cd6546ee40010cacd10f7be462d5f6a8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.4.0/relay-baton-linux-x64"
    sha256 "5b9402aa3f44bbc6ac9bb123b52aa896f263c9b60c5264a45a5d07453cd66b09"
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
