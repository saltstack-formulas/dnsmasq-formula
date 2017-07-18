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

``Example pillar configuration``
--------------------------------

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

Additional resources
======================
* git://thekelleys.org.uk/dnsmasq.git
* http://thekelleys.org.uk/dnsmasq/doc.html
* http://thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html
* http://thekelleys.org.uk/dnsmasq/CHANGELOG
