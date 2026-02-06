class Siftd < Formula
  include Language::Python::Virtualenv

  desc "Personal LLM usage analytics for CLI coding tools"
  homepage "None"
  url "https://files.pythonhosted.org/packages/86/3f/0bdef609169930d2ab39874eef885cecc1b5dd3fcedba15a8e745dd6b06b/siftd-0.4.2.tar.gz"
  sha256 "ed8a26d2e90875a1b590e0b62ffb0b5755948cba939efc0a79d6e717ac806b1f"

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
