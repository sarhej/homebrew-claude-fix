# homebrew-claude-fix

Homebrew tap for [claude-fix](https://github.com/sarhej/claude-fix), isolated
Claude Desktop profile launchers for macOS.

## Install

```bash
brew install sarhej/claude-fix/claude-fix
```

That single command taps this repository and installs the `claude-fix` command.

**Homebrew 6.0+** requires third-party taps to be trusted before their formulae
load. If `brew` stops with an *"untrusted tap"* error, run the explicit sequence
once:

```bash
brew tap sarhej/claude-fix
brew trust sarhej/claude-fix
brew install claude-fix
```

## Why a tap?

On managed and enterprise Macs, `curl … | bash` is often blocked by policy and
unsigned apps are hard to run. Homebrew is already approved on most of those
machines, installs from a pinned, checksummed release tarball, and records
exactly what landed on disk, so this is the recommended way to install.

## What it installs

- `claude-fix`: the launcher-management command (a thin wrapper around
  `make_claude_launchers.sh`).
- The profile icons, bundled locally so nothing is downloaded at runtime.

It never modifies or re-signs `Claude.app`. See the
[main project README](https://github.com/sarhej/claude-fix#readme) for usage,
safety notes, and the `--user-data-dir` caveat.

## License

MIT. See [claude-fix](https://github.com/sarhej/claude-fix/blob/main/LICENSE).

## Releasing

Every claude-fix release needs the formula bumped in lockstep. Update `url` to
the new tag and recompute `sha256` from the release tarball:

    curl -sL https://github.com/sarhej/claude-fix/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256

Homebrew installs whatever the formula pins, not whatever is on main. A missed
bump means users silently keep getting the previous release.
