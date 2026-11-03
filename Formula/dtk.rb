class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.10.0/dtk-v0.10.0-aarch64-apple-darwin.tar.gz"
    sha256 "62cfbff43340ddf32f8fdda51181dda3899fb5bdd2e4a6e3ee65175e4ce7da75"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.10.0/dtk-v0.10.0-x86_64-apple-darwin.tar.gz"
    sha256 "4f3ab27adad4f91f408f34d95b6e878c3f42141996a24aea1f1be838729ef737"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.10.0/dtk-v0.10.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "7d2a538efd3fcd4a82027240466732291d69595d8158f0ed5466ea44f2477a11"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.10.0/dtk-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c896490e43bc376f76b5f15079d0fd08db9e0ac95f7767b4e50c401433850ba3"
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
