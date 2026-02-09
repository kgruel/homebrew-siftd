class Siftd < Formula
  include Language::Python::Virtualenv

  desc "Personal LLM usage analytics for CLI coding tools"
  homepage "None"
  url "https://files.pythonhosted.org/packages/57/d9/79cac2ec4150efd8575060907bac56fcb7d4acb82f8e4b811c84307de17c/siftd-0.4.3.tar.gz"
  sha256 "66d9d442545898be3a09b1c68dbb223cbe9e2ce7d3ff175a68c4f0c8f376bff9"

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
