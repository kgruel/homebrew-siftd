class Siftd < Formula
  include Language::Python::Virtualenv

  desc "Personal LLM usage analytics for CLI coding tools"
  homepage "https://github.com/kgruel/siftd"
  url "https://files.pythonhosted.org/packages/cb/ac/8266cecc9c8bfa57b8f77a399797db308e96f38769aa2e617cc3837138c5/siftd-0.5.0.tar.gz"
  sha256 "fa60198f58c8f608c72ae2c3cc27f6fe63004a6901b6bac47b1e817d51332001"
  license "MIT"

  depends_on "python@3.12"

  resource "painted" do
    url "https://files.pythonhosted.org/packages/07/21/2b543795fd07e3a555e5ebfe97e5e6f2648e0411067891ed857fecbc8ed3/painted-0.1.4.tar.gz"
    sha256 "27267bfd56528e5fe373680b2aa83f5f9a672342669d0d983a00314c5956866a"
  end

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/c3/af/14b24e41977adb296d6bd1fb59402cf7d60ce364f90c890bd2ec65c43b5a/tomlkit-0.14.0.tar.gz"
    sha256 "cf00efca415dbd57575befb1f6634c4f42d2d87dbba376128adb42c121b87064"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/35/a2/8e3becb46433538a38726c948d3399905a4c7cabd0df578ede5dc51f0ec2/wcwidth-0.6.0.tar.gz"
    sha256 "cdc4e4262d6ef9a1a57e018384cbeb1208d8abbc64176027e2c2455c81313159"
  end

  def install
    virtualenv_create(libexec, "python3.12")
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage", shell_output("siftd --help", 0)
  end
end
