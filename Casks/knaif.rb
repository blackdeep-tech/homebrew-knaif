# Homebrew cask for knaif — installs the published, signed and notarized macOS .zip untouched.
#
# A cask, not a formula: a formula install rewrites the install names inside the bundled .dylib
# files and re-signs them ad hoc, and knaif (Developer ID, hardened runtime) then refuses to load
# libraries signed by a different team ("different Team IDs", 2026-10-16). A cask unpacks the
# release tree as published and only links the executable, which finds skills/, contracts/ and its
# libraries next to itself. ffmpeg is a dependency because the ffmpeg skill cannot run without it;
# the ~2.5 GB model is never downloaded at install time.
cask "knaif" do
  version "1.3.0"
  sha256 "bb042cc45c094503d7ef2b89df0dce9efb3bdc87e67b74b94a201fe882f8590e"

  url "https://github.com/blackdeep-tech/knaif/releases/download/v#{version}/knaif-#{version}-macos-arm64.zip"
  name "knaif"
  desc "Turn natural-language requests into validated, executable action plans"
  homepage "https://knaif.org"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"
  depends_on formula: "ffmpeg"

  binary "knaif-#{version}-macos-arm64/bin/knaif"

  caveats <<~EOS
    Download the AI model before the first run (~2.5 GB, into ~/.knaif/models):
      knaif models pull knaif-qwen3-4b-v2

    The documents skill can use these optional tools:
      brew install ghostscript tesseract
      brew install --cask libreoffice

    To see what each skill still needs:
      knaif skills deps
  EOS
end
