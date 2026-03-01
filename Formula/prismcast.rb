require "language/node"

class Prismcast < Formula
  desc "Browser-based live TV capture server for Channels DVR, Plex, and other streaming clients"
  homepage "https://github.com/hjdhjd/prismcast"
  url "https://registry.npmjs.org/prismcast/-/prismcast-1.5.1.tgz"
  sha256 "17f6fb20296d2e2e4a003fc78747e76da18f5def26074eef78eedd6e60c9ab60"
  license "ISC"

  livecheck do
    url "https://registry.npmjs.org/prismcast/latest"
    regex(/"version"\s*:\s*"v?(\d+(?:\.\d+)+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir[libexec/"bin/*"]
  end

  def caveats
    <<~EOS
      PrismCast uses Google Chrome to capture video from streaming sites.
      If you don't already have Chrome installed:
        brew install --cask google-chrome

      To upgrade PrismCast:
        prismcast upgrade

      To run PrismCast as a service:
        prismcast service install
        prismcast service start
        prismcast service stop
        prismcast service status

      The web dashboard is available at http://localhost:5589
    EOS
  end

  test do
    system bin/"prismcast", "--help"
  end
end
