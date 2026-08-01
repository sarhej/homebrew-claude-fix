class ClaudeFix < Formula
  desc "Isolated Claude Desktop profile launchers for macOS (work/personal/clients)"
  homepage "https://github.com/sarhej/claude-fix"
  url "https://github.com/sarhej/claude-fix/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "d4284c0e0a2f8a741f8cbcd5224a9a4b36c91e741c9f2e6358fd825a91cc8896"
  license "MIT"

  depends_on :macos

  def install
    libexec.install "make_claude_launchers.sh", "icons"

    (bin/"claude-fix").write <<~SH
      #!/bin/bash
      export CLAUDE_LAUNCHERS_ICONS_DIR="#{libexec}/icons"
      exec "#{libexec}/make_claude_launchers.sh" "$@"
    SH
  end

  def caveats
    <<~EOS
      claude-fix creates separate launcher apps in ~/Applications, each with its
      own Claude Desktop profile (login, history, settings, tools). Your normal
      Claude.app is never modified. Get started with:

        claude-fix          # interactive: add the missing profile
        claude-fix help     # all commands and options
    EOS
  end

  test do
    assert_match "manage isolated Claude Desktop profiles",
      shell_output("#{bin}/claude-fix help")
  end
end
