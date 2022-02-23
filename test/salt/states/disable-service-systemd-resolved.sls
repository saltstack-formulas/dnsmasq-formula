# This state is used to prepare the environment for formula testing

# (On relevant platforms, see `kitchen.yml`) Ensure the service starts without
# failure, by disabling the `systemd-resolved` service (conflict on port 53)

include:
  - dnsmasq

test-salt-states-disable-service-systemd-resolved-service-dead:
  service.dead:
    - name: systemd-resolved
    - enable: False
    - require_in:
      - service: dnsmasq
