class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.4.0/dtk-v0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "8383931fe72012023503e4cc59203f72fc73d0f19815bcb3d169ec0602d4f71f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.4.0/dtk-v0.4.0-x86_64-apple-darwin.tar.gz"
    sha256 "cd5a74b65c30a243b2237fbbe48d6ba3c0633493758887557d9204fb5313a700"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.4.0/dtk-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "4ba61714d0e25cfd3e3d78bf0b1c37021ef5531ce4a203ab26dbf43c7f7ca692"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.4.0/dtk-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7e1fc87faab1ba9000ca7bd555ae3fc25969c30794428de5b5e0e251e27fd197"
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
