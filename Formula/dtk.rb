class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.19.0/dtk-v0.19.0-aarch64-apple-darwin.tar.gz"
    sha256 "5221089bfc1081fc986151704baf5cc29939ef4a880857c36cdf8395d72115f9"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.19.0/dtk-v0.19.0-x86_64-apple-darwin.tar.gz"
    sha256 "52d3de70a6ad18edecde41e31f6a5d707a0dd7e2b0f4e4fb51124a30cfbe08b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.19.0/dtk-v0.19.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "510ba0e6bfd572aeb540a6cd35b35d79a3ea4adb35de60562215a56007b1e4f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.19.0/dtk-v0.19.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ed7e34a3d780ebce6b70836afae571537e6ba000e93260bb7116060fef1e5e75"
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
