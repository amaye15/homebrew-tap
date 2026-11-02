#!/bin/bash
# Writes Formula/dtk.rb for the newest release of amaye15/dtk. Needs the gh CLI.
# Public release data only, so the default workflow token is enough.
set -euo pipefail
repo="amaye15/dtk"
tag="${1:-$(gh release view -R "$repo" --json tagName -q .tagName)}"
sha() { gh release download "$tag" -R "$repo" -p "dtk-$tag-$1.tar.gz.sha256" -O - | awk '{print $1}'; }
url() { echo "https://github.com/$repo/releases/download/$tag/dtk-$tag-$1.tar.gz"; }
mac_arm=aarch64-apple-darwin; mac_x64=x86_64-apple-darwin
lin_arm=aarch64-unknown-linux-musl; lin_x64=x86_64-unknown-linux-musl

cat > "$(dirname "$0")/../Formula/dtk.rb" <<RUBY
class Dtk < Formula
  desc "Data token killer: a Claude Code hook that turns big tables into lean summaries"
  homepage "https://github.com/amaye15/dtk"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "$(url $mac_arm)"
    sha256 "$(sha $mac_arm)"
  elsif OS.mac? && Hardware::CPU.intel?
    url "$(url $mac_x64)"
    sha256 "$(sha $mac_x64)"
  elsif OS.linux? && Hardware::CPU.arm?
    url "$(url $lin_arm)"
    sha256 "$(sha $lin_arm)"
  elsif OS.linux? && Hardware::CPU.intel?
    url "$(url $lin_x64)"
    sha256 "$(sha $lin_x64)"
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
RUBY
echo "wrote Formula/dtk.rb for $tag"
