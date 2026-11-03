class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.15.0/dtk-v0.15.0-aarch64-apple-darwin.tar.gz"
    sha256 "d069351e87aa34e454408541dd3ac56a8f4ca84532f80844ffc1fb742792a45f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.15.0/dtk-v0.15.0-x86_64-apple-darwin.tar.gz"
    sha256 "8bd8ad5625dfd34bea461f7c98d1dcd0a8b52a26a4653b49fc1c398e651bff80"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.15.0/dtk-v0.15.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "74285034a7bcc9cd0d22ef38e3c37116efab998aa1482431e06a8daf286a384b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.15.0/dtk-v0.15.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7baf25134e8f5dfe5848f684dcc621586effc642230376ce7a344c6d56331427"
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
