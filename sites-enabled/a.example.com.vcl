# Varnish configuration file for one.example.com
# Website type: Wordpress
# Description: Illustrates application of website specific cache strategy

sub vcl_recv {
       if (req.http.host == "one.example.com" || req.http.host == "www.one.example.com") {
           # Ignore any cookies on the frontend of the website (highly cacheable).
           # It is recommended to use Disqus commenting plugin with this cache strategy.
           if (req.url !~ "^/wp-(login|admin)") {
               unset req.http.cookie;
           }
       }
}