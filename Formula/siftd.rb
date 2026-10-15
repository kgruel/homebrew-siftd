class Siftd < Formula
  include Language::Python::Virtualenv

  desc "Personal LLM usage analytics for CLI coding tools"
  homepage "https://github.com/kgruel/siftd"
  url "https://files.pythonhosted.org/packages/5e/bc/4cb10bc60f47783735565ee89c2973af4e29daf88f21ad42af0040a1e462/siftd-0.12.4.tar.gz"
  sha256 "f4f7edc2918a72d8b5ed1cac25fa6090dea78bf7107bd76fb02cb15be9f2305f"
  license "MIT"

  depends_on "openssl@3"
  depends_on "python@3.12"

  resource "asyncssh" do
    url "https://files.pythonhosted.org/packages/0f/c5/41a0d5477865c48cee65050586092dc3ba3fc1c52e29b47fba08d3a44581/asyncssh-2.24.1.tar.gz"
    sha256 "efcd36e9b35f79873535b06444a7c9b0a3c61d97081b208c7fdd3fd8a40f1eca"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "mistune" do
    url "https://files.pythonhosted.org/packages/7b/92/328a294a6de83bacb95bed01f04e0eaff4e3616ee359fc821a5dfc539b02/mistune-3.3.4.tar.gz"
    sha256 "58b5c96d6fcb61190dfe5fae498d2b2065f99cf61e9649418fd54cf1ada86dfe"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/95/b0/c7453d0b6e2073c3264468b106ee1563750cecc910965e67357e3698c83e/numpy-2.5.4.tar.gz"
    sha256 "9a94cf751c9ad8ebaa835bcd3d40dacf8534ad086b88c38029b65123c7999d2a"
  end

  resource "painted" do
    url "https://files.pythonhosted.org/packages/e8/e1/8770893cc64572fdc4fe2ec9ca59b3ebc3d083b7808600ac34e77df51fd4/painted-0.15.0.tar.gz"
    sha256 "04978fcdc9942b74bc99237ff832d8c81fb130be6ad833b82e5059618e2ab595"
  end

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/94/96/e07752635b98536177fa1f37671c8f3cdde2e724c6bcf6034b2cfb571565/tomlkit-0.15.1.tar.gz"
    sha256 "e25bbf38843005246210a12982776f27f99cb9be67160e14434d0c0d21ee1e97"
  end

  resource "typing_extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/a9/d2/f4d173e22df740bc37b1db102b386ba719b66e95b0f0d751f556b387e6d2/anyio-4.15.1.tar.gz"
    sha256 "9f28306018cbd6d329e64a36d58256edff76dd996fe423bc957326e578b82a94"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a/certifi-2026.7.22.tar.gz"
    sha256 "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/httpcore-1.0.9.tar.gz"
    sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f5/08/8eea9d4b8302028f3abb2c0813953f7aec26d33b7a8960ed760e65ff29fa/idna-3.20.tar.gz"
    sha256 "a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/f0/b4/7830542634bb2d3e62aa3b586a72d5b3b6c91c3168929e7000ef3fed041d/wcwidth-0.9.2.tar.gz"
    sha256 "ae0ef90b90f6af38b54f1fe6d58662ec33b3cb4b8391958a62416d654231727b"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
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
