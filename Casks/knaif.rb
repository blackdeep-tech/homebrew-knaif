# Homebrew cask for knaif — rendered by installers/macos/homebrew/render-cask.sh from the published,
# notarized macOS .zip, then committed to the tap as Casks/knaif.rb (blackdeep-tech/homebrew-knaif,
# D12). Do not edit a rendered copy: change this template and render again.
#
# A cask, not a formula (D19, amended 2026-10-16): a formula install rewrote the bundled .dylib
# install names and re-signed them ad hoc, and knaif (Developer ID, hardened runtime) then refused
# to load libraries signed by a different team ("different Team IDs"). A cask unpacks the release
# tree as published and only links the executable, which finds skills/, contracts/ and its
# libraries next to itself. ffmpeg is a dependency because the ffmpeg skill cannot run without it;
# the documents skill's tools are optional and listed in the caveats; the ~2.5 GB model is never
# downloaded at install time.
cask "knaif" do
  version "1.4.0"
  sha256 "d5a7bd13b07efc799742e179e84d4bd55c2e47eea565644cb4d95c210de10d63"

  url "https://github.com/blackdeep-tech/knaif/releases/download/v1.4.0/knaif-1.4.0-macos-arm64.zip"
  name "knaif"
  desc "Turn natural-language requests into validated, executable action plans"
  homepage "https://knaif.org"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"
  depends_on formula: "ffmpeg"

  binary "knaif-1.4.0-macos-arm64/bin/knaif"

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
