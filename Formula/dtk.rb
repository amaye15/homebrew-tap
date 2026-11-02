class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.8.0/dtk-v0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "7ba31615e9abfadcd154dade035ade5220514b852f23242a8aec4a2901c1c4c2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.8.0/dtk-v0.8.0-x86_64-apple-darwin.tar.gz"
    sha256 "8a2225705471992bab72e5650e9098b5feb9b09938f5db3ae5496664a47a396a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.8.0/dtk-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "78703c076b99b7e78846240ca05f3af3545d8ed939de2b2d417ca8a869e889d7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.8.0/dtk-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "fcb9b2651493a3b9b48f975cdc62f115e97860cc221b41722e63cf35e5efe2a0"
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
