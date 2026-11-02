class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.9.0/dtk-v0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "9a8d4f61ad09480998dca594a80c11e1bc3f6896e2756fb781287a932cd5353e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.9.0/dtk-v0.9.0-x86_64-apple-darwin.tar.gz"
    sha256 "4833097738dcbfeffa146053f1b9a726affa96c93f2ce1acc21edbf9712edfd4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.9.0/dtk-v0.9.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "cebaf58437d6baac9f911546e11a6b3548863bd906f5005c390e50480f2a4a78"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.9.0/dtk-v0.9.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "506ba9241b29833b5b791e675b0e9b4c1b0c76abe70e9619def87ab9652d9a6c"
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
