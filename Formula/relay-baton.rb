class RelayBaton < Formula
  desc "Token-aware handoff harness for Codex CLI and Claude Code"
  homepage "https://github.com/dgl1231/relay-baton"
  version "1.6.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.6.0/relay-baton-macos-arm64"
    sha256 "d39745f0d06cae3f27b81f1c02b29d0f3723a2f2582f988530be2113e4416563"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.6.0/relay-baton-linux-x64"
    sha256 "3053e24102802aa09a5c9192564051bde5348bf7f5d2957691650e9806fa8dfb"
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
