python-pip:
  pkg.installed

paramiko:
  pip.installed:
    - name: paramiko
    - require:
      - pkg: python-pip

testinfra:
  pip.installed:
    - name: testinfra
    - require:
      - pkg: python-pip

fish:
  pkg.installed
