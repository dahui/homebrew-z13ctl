class Z13gui < Formula
  desc "GTK4 overlay GUI companion for z13ctl"
  homepage "https://github.com/dahui/z13gui"
  url "https://github.com/dahui/z13gui/releases/download/v1.0.0/z13gui_1.0.0_linux_amd64.tar.gz"
  sha256 "c3af2505199180f1c241db74b72c8442243983c4df74ded319fdb5008afd1f93"
  license "Apache-2.0"

  depends_on :linux
  depends_on "gtk4"
  depends_on "gtk4-layer-shell"
  depends_on "z13ctl"

  def install
    bin.install "z13gui"
  end

  def caveats
    <<~EOS
      After installation, enable the z13gui service:
        systemctl --user enable --now z13gui
    EOS
  end

  test do
    system "#{bin}/z13gui", "--help"
  end
end
