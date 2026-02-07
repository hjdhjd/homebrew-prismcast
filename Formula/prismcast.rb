require "language/node"

class Prismcast < Formula
  desc "Browser-based live TV streaming server for Channels DVR and Plex"
  homepage "https://github.com/hjdhjd/prismcast"
  url "https://registry.npmjs.org/prismcast/-/prismcast-1.1.0.tgz"
  sha256 "031d51c8b68c0f017677466f7d6ad864ea399e96b2305c4e1d712c59cb42c0d6"
  license "ISC"

  livecheck do
    url "https://registry.npmjs.org/prismcast/latest"
    regex(/"version"\s*:\s*"v?(\d+(?:\.\d+)+)"/i)
  end

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir[libexec/"bin/*"]
  end

  service do
    run opt_bin/"prismcast"
    keep_alive true
    log_path var/"log/prismcast.log"
    error_log_path var/"log/prismcast.log"
    environment_variables PATH: "#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
  end

  def caveats
    <<~EOS
      PrismCast uses Google Chrome to capture video from streaming sites.
      If you don't already have Chrome installed:
        brew install --cask google-chrome

      To run PrismCast as a service:
        brew services start prismcast

      PrismCast also includes built-in service management:
        prismcast service install
        prismcast service start
        prismcast service stop

      The web dashboard is available at http://localhost:5589
    EOS
  end

  test do
    system bin/"prismcast", "--help"
  end
end
