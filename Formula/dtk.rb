class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.18.0/dtk-v0.18.0-aarch64-apple-darwin.tar.gz"
    sha256 "5efe5dde5bbc5c84a308550800da178e3ae9bdbf9e965af777068ed1436595fa"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.18.0/dtk-v0.18.0-x86_64-apple-darwin.tar.gz"
    sha256 "8e4a3ed610ec5f65658a9b8cf786901dc4702d5be6baaaed5aad158644e5d54e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.18.0/dtk-v0.18.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5a73a98d54c3aecf8645839929ae454e237a11f03af624f58d7a6a9f97d9f6ee"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.18.0/dtk-v0.18.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "458da650a21df21edd1d12eea49565a8800df25fc36156155c483e859d932fc7"
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
