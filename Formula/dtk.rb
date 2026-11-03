class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.12.0/dtk-v0.12.0-aarch64-apple-darwin.tar.gz"
    sha256 "a1097ede8bac2cdb6831d0173e4191099a3231a5049fb64d0e0dcdaae79f6f30"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.12.0/dtk-v0.12.0-x86_64-apple-darwin.tar.gz"
    sha256 "8ff187e9aa85575a727000c31e6d3e61343b047b3894b63c9810bcd16e4e63e3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.12.0/dtk-v0.12.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ad820bd409b0b71045f05f54a330a60952f55659a1e14fa5d9091e9b0e7b79b5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.12.0/dtk-v0.12.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "572c817bfab627ba8ec6c29d46f7c8e89fa0f24a526950118b2b5888ea2cbc60"
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
