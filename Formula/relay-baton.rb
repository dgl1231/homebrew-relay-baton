class RelayBaton < Formula
  desc "Token-aware handoff harness for Codex CLI and Claude Code"
  homepage "https://github.com/dgl1231/relay-baton"
  version "1.6.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.6.1/relay-baton-macos-arm64"
    sha256 "02e3b344b6f0d49b4f4232a39cd2adc8567bb150bf0a818c6aa61d523ebeb967"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dgl1231/relay-baton/releases/download/v1.6.1/relay-baton-linux-x64"
    sha256 "0c2bc03cc2d89db55f740f93fd134f5b6f286b505ec21113b91683e5a4b50731"
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
