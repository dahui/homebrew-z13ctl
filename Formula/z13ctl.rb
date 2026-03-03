class Z13ctl < Formula
  desc "CLI and daemon for ASUS ROG Flow Z13 hardware control"
  homepage "https://github.com/dahui/z13ctl"
  url "https://github.com/dahui/z13ctl/releases/download/v1.0.1/z13ctl_1.0.1_linux_amd64.tar.gz"
  sha256 "433fe5f82324247752d8c71dc0173a731fa473d9536c567e21c98880a1769a21"
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
