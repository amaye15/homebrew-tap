class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  version "0.3.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.3.0/dtk-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "de66efce11f13ee6dee713dbd2374a8c77da7b90e536f265080187c87feffde0"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.3.0/dtk-v0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "b2608e574eaae7d639b78d683394086e727ab5910c124ac5e7291f2d5beb6f73"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.3.0/dtk-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "284b007ceb3053a96ade94af08014dd7c98a618f97fd9778a305c105e643285a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.3.0/dtk-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "73348c68627382ad1f531d46410bcab0bc61511209ca723de2cfea9aca67fbb4"
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
