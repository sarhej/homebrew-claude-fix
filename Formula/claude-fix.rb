class ClaudeFix < Formula
  desc "Isolated Claude Desktop profile launchers for macOS (work/personal/clients)"
  homepage "https://github.com/sarhej/claude-fix"
  url "https://github.com/sarhej/claude-fix/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "ced68652fe0259ae2096c5ad24198c3a52f03a5b77fea78ba875c648cfbd2bd1"
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
