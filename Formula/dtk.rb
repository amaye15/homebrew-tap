class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.11.0/dtk-v0.11.0-aarch64-apple-darwin.tar.gz"
    sha256 "792b3502cc58bc2547f6faee45487f4e175e5405b24d2852e1edab86e4251f2a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.11.0/dtk-v0.11.0-x86_64-apple-darwin.tar.gz"
    sha256 "56c8c689157f3823123c0c3176f77ea32fd5f4cd8761ffd76becc10b75f40615"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.11.0/dtk-v0.11.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b3c6ea232100db979d404c416d6a3dc36a26f650e131f0c7a03d614f6e2268a5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.11.0/dtk-v0.11.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ec55db6b70ec63ce966d6ae4bcbbb0337ed5666e3004a600fd8a20f9aad394b8"
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
