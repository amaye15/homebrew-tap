class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.14.0/dtk-v0.14.0-aarch64-apple-darwin.tar.gz"
    sha256 "f1fcaa3830ba30ffe975d263c8ce391ded05b708e6132bebd8d47e946b27d066"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.14.0/dtk-v0.14.0-x86_64-apple-darwin.tar.gz"
    sha256 "f8562abd5ca5b8aacf90c80ab37d90a88d5d5256005fe6fe2774752cc5d8384d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.14.0/dtk-v0.14.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "659381f8d80cbf9e79e8ef6802a4b461d3ed1399215956c097363becf3c30f87"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.14.0/dtk-v0.14.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6510f22dee43c4cf8e2c55eca7f19afbfc6e7c30f75459379f00ae86607a1eeb"
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
