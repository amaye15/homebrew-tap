class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.16.0/dtk-v0.16.0-aarch64-apple-darwin.tar.gz"
    sha256 "bad25bdbd2b502c4240a57fe84a498d1a5e477d2d5582a03a58d72604f852c72"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.16.0/dtk-v0.16.0-x86_64-apple-darwin.tar.gz"
    sha256 "1b3acd06b03880e137c5d71bb21479887f1e9c9941a4e3c22d0ac73c5f9fde8e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.16.0/dtk-v0.16.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "bcc3487b58f8a64393ac9638d1d5e69ed24b85039bdb42dafdb10ce3204e9252"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.16.0/dtk-v0.16.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4e3b2b358dbdf4a2f6f0b39dd550ed66da2522bfffd9b7cc68a5d2204e2f1821"
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
