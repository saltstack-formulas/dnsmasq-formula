dnsmasq:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - pkg: dnsmasq
    - watch:
      - file: /etc/dnsmasq.conf
      - file: /etc/dnsmasq.d

/etc/dnsmasq.conf:
  file.managed:
    - source: salt://dnsmasq/files/dnsmasq.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: dnsmasq

/etc/dnsmasq.d:
  file.recurse:
    - source: salt://dnsmasq/files/dnsmasq.d
    - template: jinja
    - require:
      - pkg: dnsmasq
