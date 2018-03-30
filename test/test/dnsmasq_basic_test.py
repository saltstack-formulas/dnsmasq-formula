import pytest


@pytest.mark.slow
def test_dnsmasq_installs_and_removes(host):
    dnsmasq = host.package("dnsmasq")
    with host.sudo():
        host.salt("state.apply", "dnsmasq")
    assert dnsmasq.is_installed
    with host.sudo():
        host.salt("state.apply", "dnsmasq/absent")
    assert not dnsmasq.is_installed
