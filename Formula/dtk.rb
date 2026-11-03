class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.13.0/dtk-v0.13.0-aarch64-apple-darwin.tar.gz"
    sha256 "df3aca6ff9aec726af4950b16758a36c1fa4ee30a061b1b92faa9a362604e67c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.13.0/dtk-v0.13.0-x86_64-apple-darwin.tar.gz"
    sha256 "b75c5c8c4904475755fa08f22ac135006a1d3ccc921e9f6efa0d681891674337"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.13.0/dtk-v0.13.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f9410c780cf50c6e74c0d08ad439e2f948a0ab2d9b9fd1c9ae0e50ad1efe9205"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.13.0/dtk-v0.13.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b32b8c103544f56ea0c6ea90b67ea77ffba6a5da1963d26e86a28e24f78e24d1"
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
