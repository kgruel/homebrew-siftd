class Siftd < Formula
  include Language::Python::Virtualenv

  desc "Personal LLM usage analytics for CLI coding tools"
  homepage "None"
  url "https://files.pythonhosted.org/packages/cd/12/f87d7f06a35e628e0cfb7eecd195360c87e38a57defd9b9023d72ca67e3d/siftd-0.4.0.tar.gz"
  sha256 "08d50a26afeef7a2968696e705b750f4b00a0064e80d843e8a23661f23c7c29f"

  depends_on "python3"

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/57/fd/0005efbd0af48e55eb3c7208af93f2862d4b1a56cd78e84309a2d959208d/numpy-2.4.2.tar.gz"
    sha256 "659a6107e31a83c4e33f763942275fd278b21d095094044eb35569e86a21ddae"
  end

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
