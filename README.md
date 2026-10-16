# Homebrew tap for knaif

[knaif](https://github.com/blackdeep-tech/knaif) turns plain-language requests into validated
commands for local tools, with a small model running on your own Mac.

```bash
brew install blackdeep-tech/knaif/knaif
knaif models pull knaif-qwen3-4b-v2     # the AI model, ~2.5 GB
knaif skills deps                       # what each skill still needs
```

Apple Silicon, macOS 12 or later. The formula installs the signed, notarized release `.zip`
published on [GitHub Releases](https://github.com/blackdeep-tech/knaif/releases); it is rendered
from that file by `installers/macos/homebrew/render-formula.sh` in the knaif repository, so do not
edit it by hand. Issues go to [blackdeep-tech/knaif](https://github.com/blackdeep-tech/knaif/issues).
