# Varnish configuration file for two.example.com
# Website type: Trac daemon running on port 3050
# Description: Example of putting backend definition into a "virtual host" configuration for Varnish

backend trac {
    .host = "127.0.0.1";
    .port = "3050";
}

sub vcl_recv {
       if (req.http.host == "two.example.com" || req.http.host == "www.two.example.com") {
           set req.backend_hint = trac;
       }
}