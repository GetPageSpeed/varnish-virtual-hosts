# Varnish configuration file for d.example.com
# Website type: Wordpress with native comment system
# Description: Illustrates application of website specific cache strategy

sub vcl_recv {
       if (req.http.host == "d.example.com" || req.http.host == "www.d.example.com") {
           # It is recommended to use Disqus commenting plugin and use "a" example instead.
           if (req.http.Cookie !~ "comment_author_|wordpress_(?!test_cookie)|wp-postpass_|woocommerce|wp-resetpass") {
                # no Wordpress cookies, nuke the rest!
                unset req.http.cookie;
            }           
       }
}
