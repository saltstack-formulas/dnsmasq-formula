include:
  - dnsmasq

extend:
  dnsmasq:
    pkg:
      - purged
    service:
      - dead
      - enable: False
