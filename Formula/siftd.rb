class Siftd < Formula
  include Language::Python::Virtualenv

  desc "Personal LLM usage analytics for CLI coding tools"
  homepage "https://github.com/kgruel/siftd"
  url "https://files.pythonhosted.org/packages/00/3a/41a81d8e382e606d04c47981148065d6cfd94c2dd765ea5cbecb7af2eff0/siftd-0.4.7.tar.gz"
  sha256 "1e31ea5d6b94926168d47906fb7820ef5ba4fbd29efed391d947ba726121936a"
  license "MIT"

  depends_on "python@3.12"

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/c3/af/14b24e41977adb296d6bd1fb59402cf7d60ce364f90c890bd2ec65c43b5a/tomlkit-0.14.0.tar.gz"
    sha256 "cf00efca415dbd57575befb1f6634c4f42d2d87dbba376128adb42c121b87064"
  end

  def install
    virtualenv_create(libexec, "python3.12")
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage", shell_output("siftd --help", 0)
  end
end
