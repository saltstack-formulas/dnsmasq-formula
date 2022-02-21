# frozen_string_literal: true

control 'dnsmasq.package.install' do
  title 'The required package should be installed'

  # Overide by `platform_finger`
  package_name = 'dnsmasq'

  describe package(package_name) do
    it { should be_installed }
  end
end
