# Homebrew tap for knaif

[knaif](https://github.com/blackdeep-tech/knaif) turns plain-language requests into validated
commands for local tools, with a small model running on your own Mac.

```bash
brew install blackdeep-tech/knaif/knaif
knaif models pull knaif-qwen3-4b-v2     # the AI model, ~2.5 GB
knaif skills deps                       # what each skill still needs
```

Apple Silicon, macOS 12 or later. `Casks/knaif.rb` installs the signed, notarized release `.zip`
published on [GitHub Releases](https://github.com/blackdeep-tech/knaif/releases) exactly as
published: a cask, not a formula, because a formula install re-signs the bundled libraries and
knaif then refuses to load them.

Installed the earlier formula on 2026-10-16? Replace it:

```bash
brew uninstall --formula knaif
brew update && brew install blackdeep-tech/knaif/knaif
``` Issues go to [blackdeep-tech/knaif](https://github.com/blackdeep-tech/knaif/issues).
