class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.5.0/dtk-v0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "c4de9a08948d259688a54e87915fec8f4ee4444c8c85215594987b4f9dc99ef3"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.5.0/dtk-v0.5.0-x86_64-apple-darwin.tar.gz"
    sha256 "f09b5b592c5d000a02111f616347b70db9c07ace457188b050b9f8bbf5172adc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/amaye15/dtk/releases/download/v0.5.0/dtk-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5babb7758f350337d6c92da4c9444b45bec44e0cdd7db9ed643b0aed89ad93c9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/amaye15/dtk/releases/download/v0.5.0/dtk-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a28432910332b29e0f9b8df52e31d1e59c0c6708b7f0c9bb6774a96ba165d80e"
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
