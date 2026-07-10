class RelayBaton < Formula
  desc "Token-aware handoff harness for Codex CLI and Claude Code"
  homepage "https://github.com/dgl1231/relay-baton"
  version "1.3.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.3.1/relay-baton-macos-arm64"
    sha256 "a88750ab9cb462c0737742c9de48b3e43649fe4f92631be8460a9d90dbe4d877"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.3.1/relay-baton-linux-x64"
    sha256 "e0b8690c228722d8df5fc7ad2380ae638dbaec2293c323fdbeff3484457a7dfc"
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
