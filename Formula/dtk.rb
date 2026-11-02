class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.6.0/dtk-v0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "0e1af9f75954141e55a5bf279f76ef2366028b5fba6a4751d52cd9ddd7440129"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.6.0/dtk-v0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "f2ec97f30b7c1adf90a70687a2892d58fc7989138758c9074ba35911d3eb6f07"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.6.0/dtk-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ae282c75db0563b0dcb316865ca061b640f2f554bf699fc3794ee7896f8c7971"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.6.0/dtk-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7a4ccb503114e98910eda32c5490abc14b6f1b7b070f178ba6b026f62538592c"
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
