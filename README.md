# Homebrew tap for dtk

[dtk](https://github.com/amaye15/dtk) is a Claude Code hook that turns big tables in command
output into short summaries. It works with [rtk](https://github.com/rtk-ai/rtk).

```sh
brew install amaye15/tap/dtk
dtk init --global
dtk verify
```

The formula follows the dtk releases by itself (`.github/workflows/update.yml`). To uninstall:
`dtk init --uninstall --purge`, then `brew uninstall dtk`.
