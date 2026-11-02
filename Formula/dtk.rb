class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.7.0/dtk-v0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "f3b71d43ad3b66ac27cd9038a89a555c629ad7c32afa0dd03a031229bda8c791"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.7.0/dtk-v0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "8f284efe16cd8c4e0ce028a8eecc18a7142a9bf6b188c66d28d9e2b3928c4941"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.7.0/dtk-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "cf1717be627236110537dab113dc9d3120b892108ac995214db980f2015b9235"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.7.0/dtk-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "baac2ad53e477c1ef73ce07df4d5349aa7f5d5fc812cc09792cada2339f4f987"
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
