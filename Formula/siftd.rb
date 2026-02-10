class Siftd < Formula
  include Language::Python::Virtualenv

  desc "Personal LLM usage analytics for CLI coding tools"
  homepage "https://github.com/kgruel/siftd"
  url "https://files.pythonhosted.org/packages/7b/60/67908b20106f1c3f852d493729100dddcedd47057b551793250c66e6ebce/siftd-0.4.4.tar.gz"
  sha256 "936680446f9260e34f6d5cd4cd3327b946519670a68cf158cb13275e64aa153e"
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
