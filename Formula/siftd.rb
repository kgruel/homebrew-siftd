class Siftd < Formula
  include Language::Python::Virtualenv

  desc "Personal LLM usage analytics for CLI coding tools"
  homepage "https://github.com/kgruel/siftd"
  url "https://files.pythonhosted.org/packages/ac/42/71541638ee64594edcefeb90685329ecb2dfb88e00e9f5366bfbfe6aa16f/siftd-0.8.0.tar.gz"
  sha256 "b72e40b546eb2b15ff2c12001a437695655ccc5758fc52f86aee7fb133a00143"
  license "MIT"

  depends_on "openssl@3"
  depends_on "python@3.12"

  resource "asyncssh" do
    url "https://files.pythonhosted.org/packages/fc/d5/957886c316466349d55c4de6a688a10a98295c0b4429deb8db1a17f3eb19/asyncssh-2.22.0.tar.gz"
    sha256 "c3ce72b01be4f97b40e62844dd384227e5ff5a401a3793007c42f86a5c8eb537"
  end

  resource "painted" do
    url "https://files.pythonhosted.org/packages/6b/57/f34dd48266fe50e8c2d2a8800a6eb0411cdad34687beedbc69c39419c98f/painted-0.1.7.tar.gz"
    sha256 "3cad4f90f0f06f7c02a01aecde87486fb27604f642c2ef3ea08afc2a829248d4"
  end

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/c3/af/14b24e41977adb296d6bd1fb59402cf7d60ce364f90c890bd2ec65c43b5a/tomlkit-0.14.0.tar.gz"
    sha256 "cf00efca415dbd57575befb1f6634c4f42d2d87dbba376128adb42c121b87064"
  end

  resource "typing_extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/2c/ee/afaf0f85a9a18fe47a67f1e4422ed6cf1fe642f0ae0a2f81166231303c52/wcwidth-0.7.0.tar.gz"
    sha256 "90e3a7ea092341c44b99562e75d09e4d5160fe7a3974c6fb842a101a95e7eed0"
  end

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", 'cryptography'
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage", shell_output("siftd --help", 0)
  end
end
