class Siftd < Formula
  include Language::Python::Virtualenv

  desc "Personal LLM usage analytics for CLI coding tools"
  homepage "None"
  url "https://files.pythonhosted.org/packages/81/2e/04cd3853b42c1b4b18eef2fc9fc41191467fc3c42b74cb3fd7a6656f45a0/siftd-0.4.1.tar.gz"
  sha256 "9a8e42575396611b53fc2c395bddc92af05117540e7dcf91b975aff8aff043a7"

  depends_on "python3"

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/c3/af/14b24e41977adb296d6bd1fb59402cf7d60ce364f90c890bd2ec65c43b5a/tomlkit-0.14.0.tar.gz"
    sha256 "cf00efca415dbd57575befb1f6634c4f42d2d87dbba376128adb42c121b87064"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    false
  end
end

