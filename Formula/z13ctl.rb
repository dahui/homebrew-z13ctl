class Z13ctl < Formula
  desc "CLI and daemon for ASUS ROG Flow Z13 hardware control"
  homepage "https://github.com/dahui/z13ctl"
  url "https://github.com/dahui/z13ctl/releases/download/v1.0.1/z13ctl_1.0.1_linux_amd64.tar.gz"
  sha256 "c18354776cd5543bac63651a86a28d7d086c202fd411dd5cb4e94550f7cbb92b"
  license "Apache-2.0"

  on_macos do
    disable! date: "2025-01-01", because: "z13ctl only supports Linux"
  end

  def install
    bin.install "z13ctl"
  end

  def caveats
    <<~EOS
      After installation, run setup to configure device access rules:
        sudo z13ctl setup

      Then enable the daemon for your user:
        systemctl --user enable --now z13ctl.socket z13ctl.service
    EOS
  end

  test do
    system "#{bin}/z13ctl", "--version"
  end
end
