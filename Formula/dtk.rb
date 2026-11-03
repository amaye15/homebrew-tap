class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.13.1/dtk-v0.13.1-aarch64-apple-darwin.tar.gz"
    sha256 "0c75cee0406ec97414885e59d8c1b0e0706098337907e19186461b9cd236166c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.13.1/dtk-v0.13.1-x86_64-apple-darwin.tar.gz"
    sha256 "9fe85e6571e9e291d1582942408a2237c6f1b4d66c281546341febf7ebe557db"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.13.1/dtk-v0.13.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d48b98cbb48c1903a3e02b50aa20b72c01dbb61a476fc22e760383f20fb009a5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.13.1/dtk-v0.13.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3d05b1a615eb490bb6572b6d95987dff733433810083a1ce9d8687739875d13a"
  end

  def install
    bin.install "dtk"
  end

  def caveats
    <<~EOS
      dtk is installed. Get started:

        dtk init --global     # register the Claude Code hook (works with rtk)
        dtk verify            # check that everything works
        dtk discover          # see what dtk would have saved in your history

      Uninstall: dtk init --uninstall --purge, then brew uninstall dtk

      Documentation: https://github.com/amaye15/dtk
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dtk --version")
  end
end
