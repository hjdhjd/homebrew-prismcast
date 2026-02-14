require "language/node"

class Prismcast < Formula
  desc "Browser-based live TV streaming server for Channels DVR and Plex"
  homepage "https://github.com/hjdhjd/prismcast"
  url "https://registry.npmjs.org/prismcast/-/prismcast-1.3.1.tgz"
  sha256 "3fc90e0f5343f379d9ced113f4ce6229a91266615b95f4958dcba51f0ed281bf"
  license "ISC"

  livecheck do
    url "https://registry.npmjs.org/prismcast/-/prismcast-1.3.1.tgz"
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
