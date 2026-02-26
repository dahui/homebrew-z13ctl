class Z13gui < Formula
  desc "GTK4 overlay GUI companion for z13ctl"
  homepage "https://github.com/dahui/z13gui"
  url "https://github.com/dahui/z13gui/releases/download/v1.0.2/z13gui_1.0.2_linux_amd64.tar.gz"
  sha256 "6363fa76d692c7b739e1c03360484927b923790bb6588ba37a178243c5a6f04d"
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
