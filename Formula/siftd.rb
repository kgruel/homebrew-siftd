class Siftd < Formula
  include Language::Python::Virtualenv

  desc "Personal LLM usage analytics for CLI coding tools"
  homepage "https://github.com/kgruel/siftd"
  url "https://files.pythonhosted.org/packages/1d/e9/f852224973fba34055130986d30a5f2893077fa6b63fcbb13968626ab15f/siftd-0.5.5.tar.gz"
  sha256 "ec3cd397fb7e4f278fd89c19dde3d7fbc61e73126e2cca3092b30cce339b950c"
  license "MIT"

  depends_on "python@3.12"

  resource "painted" do
    url "https://files.pythonhosted.org/packages/6b/57/f34dd48266fe50e8c2d2a8800a6eb0411cdad34687beedbc69c39419c98f/painted-0.1.7.tar.gz"
    sha256 "3cad4f90f0f06f7c02a01aecde87486fb27604f642c2ef3ea08afc2a829248d4"
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
