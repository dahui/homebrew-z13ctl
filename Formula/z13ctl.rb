class Z13ctl < Formula
  desc "CLI and daemon for ASUS ROG Flow Z13 hardware control"
  homepage "https://github.com/dahui/z13ctl"
  url "https://github.com/dahui/z13ctl/releases/download/v1.0.0/z13ctl_1.0.0_linux_amd64.tar.gz"
  sha256 "7bfbea2fa1c53c55f47848823472a9b3d9c75114848ec9decd4031bfa7996aa7"
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
