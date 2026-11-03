class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.17.0/dtk-v0.17.0-aarch64-apple-darwin.tar.gz"
    sha256 "94eac831efa394ae8c303b3eae409c685ac950b105783fdf3ea4eeb742c05220"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.17.0/dtk-v0.17.0-x86_64-apple-darwin.tar.gz"
    sha256 "07470dec6439a724df8d13255224c966fc080251dd8cbbd06d5391ef522763da"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.17.0/dtk-v0.17.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b56d426645f88ed22e9195a0a1a65c440888e703c75a716e73e091ae48a1a78a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.17.0/dtk-v0.17.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1c8d921a05122f790eaedd62fe62c836db3a7dc7e593c83d7f7963397c13518d"
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
