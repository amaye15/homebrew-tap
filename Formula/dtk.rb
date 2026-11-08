class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.21.0/dtk-v0.21.0-aarch64-apple-darwin.tar.gz"
    sha256 "6affdb0ec722912911653d40a954df6c4027fbe1b5bc82e0749e7b03a8ca7f85"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.21.0/dtk-v0.21.0-x86_64-apple-darwin.tar.gz"
    sha256 "c7fcb2ca1fb50820249fcbf76b7b0d82ea69296f510ece2188916b3d01240d43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.21.0/dtk-v0.21.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "e7159c1c2098269e8a1b6254bf48d6d21309ddda76f403d9f4e6f8534765bf85"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.21.0/dtk-v0.21.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6bdb64643a90b70a618c1adf1b759d30a26b776fedf7a09167ef7e137081aa1e"
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
