class ClaudeFix < Formula
  desc "Isolated Claude Desktop profile launchers for macOS (work/personal/clients)"
  homepage "https://github.com/sarhej/claude-fix"
  url "https://github.com/sarhej/claude-fix/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "b58178bb19fee5584c5b5d806442519435efe711d8589eed7d81007c45496c40"
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
        claude-fix doctor    # check launchers / oauth-router
    EOS
  end

  test do
    assert_match "manage isolated Claude Desktop profiles",
      shell_output("#{bin}/claude-fix help")
  end
end
