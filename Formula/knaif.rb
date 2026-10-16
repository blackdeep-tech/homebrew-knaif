# Homebrew formula for knaif — rendered by installers/macos/homebrew/render-formula.sh from the
# published, notarized macOS .zip, then committed to the tap (blackdeep-tech/homebrew-knaif, D12).
# Do not edit a rendered copy: change this template and render again.
#
# Shape decided in D19: ffmpeg is a dependency because the ffmpeg skill cannot run without it; the
# documents skill's tools are optional and listed in the caveats; the ~2.5 GB model is never
# downloaded at install time.
class Knaif < Formula
  desc "Turn natural-language requests into validated, executable action plans"
  homepage "https://knaif.org"
  url "https://github.com/blackdeep-tech/knaif/releases/download/v1.3.0/knaif-1.3.0-macos-arm64.zip"
  sha256 "bb042cc45c094503d7ef2b89df0dce9efb3bdc87e67b74b94a201fe882f8590e"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :monterey
  depends_on "ffmpeg"

  def install
    # The release tree is self-contained and finds skills/, contracts/ and its backends next to
    # the real executable, so it goes into libexec whole and only the executable is linked.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knaif"
  end

  def caveats
    <<~EOS
      Download the AI model before the first run (~2.5 GB, into ~/.knaif/models):
        knaif models pull knaif-qwen3-4b-v2

      The documents skill can use these optional tools:
        brew install ghostscript tesseract
        brew install --cask libreoffice

      To see what each skill still needs:
        knaif skills deps
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knaif --version")
    assert_match "ffmpeg", shell_output("#{bin}/knaif skills list")
  end
end
