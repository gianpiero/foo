class Rtiutils < Formula
  desc "simple utilities for RTI Connext DDS"
  homepage "http://www.rti.com"
  url "https://github.com/gianpiero/foo/raw/master/brew/pkgs/rtiutils-5.2.1.tar.gz"
  sha256 "9a187ed7b900664bf64b0aa7465faa241ec93b59cee15f8faa4ddd82245f76b7"

  bottle :unneeded

  def install
    bin.install "rtiddsspy", "rtiddsping", "rtiddsprototyper"
  end
end
