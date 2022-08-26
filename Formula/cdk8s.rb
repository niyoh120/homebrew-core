require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.0.95.tgz"
  sha256 "923b1d08b36d06bf03826e33ea68999a9339f5c3fe004cd47ac247d9225d6f09"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "b1e29e50a55436d20b8e6005aefc13f464f011695cc146a1f3f141625887cb19"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
