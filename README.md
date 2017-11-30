# Varnish Virtual Hosts

This is Varnish boilerplate configuration. 
Its primary purpose is to illustrate the clean way of managing multiple websites in Varnish.

For each website where you need to implement specific caching rules, add a VCL file under ```sites-enabled``` directory.
You can copy paste from the existing ones, or rename them to match your websites' domain names.

Read original post on the approach [here](https://www.getpagespeed.com/server-setup/varnish/varnish-virtual-hosts).

