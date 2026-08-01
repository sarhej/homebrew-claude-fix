# homebrew-claude-fix

Homebrew tap for [claude-fix](https://github.com/sarhej/claude-fix) — isolated
Claude Desktop profile launchers for macOS.

## Install

```bash
brew install sarhej/claude-fix/claude-fix
```

That single command taps this repository and installs the `claude-fix` command.
Equivalently:

```bash
brew tap sarhej/claude-fix
brew install claude-fix
```

## Why a tap?

On managed and enterprise Macs, `curl … | bash` is often blocked by policy and
unsigned apps are hard to run. Homebrew is already approved on most of those
machines, installs from a pinned, checksummed release tarball, and records
exactly what landed on disk — so this is the recommended way to install.

## What it installs

- `claude-fix` — the launcher-management command (a thin wrapper around
  `make_claude_launchers.sh`).
- The profile icons, bundled locally so nothing is downloaded at runtime.

It never modifies or re-signs `Claude.app`. See the
[main project README](https://github.com/sarhej/claude-fix#readme) for usage,
safety notes, and the `--user-data-dir` caveat.

## License

MIT — see [claude-fix](https://github.com/sarhej/claude-fix/blob/main/LICENSE).
