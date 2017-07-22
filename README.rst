===============
dnsmasq-formula
===============

``dnsmasq`` provides DNS services, as well as optional DHCP and TFTP services.

Available States
================

.. contents::
    :local:

``dnsmasq``
-----------

Install the dnsmasq package, start the service and apply custom settings.


``dnsmasq.absent``
------------------

Remove the dnsmasq package, and stop the associated dnsmasq service.

Example pillar configuration
----------------------------

.. code-block:: yaml

  dnsmasq:
    addresses:
      test.com: 1.2.3.4
      another.org: 2.3.4.5

    cnames:
      mydomain.com:
        domain01: server01.cloud.com
        domain02: server42.cloud.com

    hosts:
      cloud.com:
        server01: 1.0.0.1
        server42: 1.0.0.42

Tests
=====

Tests are written with `Testinfra <http://testinfra.readthedocs.io/>`_ (a plugin for `Pytest <https://docs.pytest.org/>`_) and are run with Vagrant and VirtualBox.

Directory structure:

.. code-block::

  test/
  ├── Vagrantfile
  ├── root/             <== Virtualbox shared folders
  │   ├── etc/
  │   │   └── salt/     <== Master and minion configuration
  │   └── srv/          <== Classic Salt /srv directory
  │       ├── pillar/
  │       └── salt/
  └── test/             <== The tests

In addition, we will also mount the whole `dnsmasq-formula` repo under `/srv/formulas/dnsmasq-formula` (see the `Vagrantfile`) for details.

First time only: setup the test environment
-------------------------------------------

.. code-block:: shell

  cd test
  
  # Spin up the VM (First run: will take some time)
  vagrant up
  
  # Connect to the VM
  vagrant ssh
  
  # Accept the salt minion key
  sudo salt-key -y -a saltmaster
  
  # Update all packages (will take some time)
  sudo salt saltmaster pkg.upgrade
  
  # Run highstate (will install Testinfra)
  sudo salt saltmaster state.apply
  
  # You are now ready to run the tests!

Subsequent test runs
--------------------

.. code-block:: shell

  cd test
  vagrant up
  vagrant ssh
  cd test
  
  # Run the tests
  pytest
  
  # Run only the "fast" tests
  pytest -m 'not slow'

  # Exit to the host
  exit
  # Stop the VM
  vagrant halt


Additional resources
======================
* git://thekelleys.org.uk/dnsmasq.git
* http://thekelleys.org.uk/dnsmasq/doc.html
* http://thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html
* http://thekelleys.org.uk/dnsmasq/CHANGELOG
