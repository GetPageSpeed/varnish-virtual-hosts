# Varnish configuration file for three.example.com
# Website type: Wordpress with WooCommerce plugin
# Description: Illustrates application of website specific cache strategy

sub vcl_recv {
    if (req.http.host == "c.example.com" || req.http.host == "www.c.example.com") {
        # Bypass cache for checkout pages:
        if (req.url ~ "/(cart|my-account|checkout|addons|/?add-to-cart=)") {
            return (pass);
        }
    }
}
