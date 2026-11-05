class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.20.0/dtk-v0.20.0-aarch64-apple-darwin.tar.gz"
    sha256 "cf0e6d32de13dbbf3f46763fdf5a479a048c946525dbc612be2b70febd576816"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.20.0/dtk-v0.20.0-x86_64-apple-darwin.tar.gz"
    sha256 "35bc2c28a853d440a6af052e894d00009726233e60da6a9e51414c896c00d68f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.20.0/dtk-v0.20.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0ea6249ba1f102f096daa1f839acd9b336c8067b29031f722d610ee848741fe9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.20.0/dtk-v0.20.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "61c71828ce9f75aa3c96ca92cec93a5a68c552083d4ba6ebccc27f4dc062d32a"
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
