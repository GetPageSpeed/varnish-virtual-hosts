vcl 4.0;

# This is our default backend.
# Most common: nginx listens on port 8080 of the same machine.
backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

# The following routines will apply to every website:
sub vcl_recv {
    # Normalize the header, remove the port (in case you're testing this on various TCP ports)
    set req.http.host = regsub(req.http.host, ":[0-9]+", "");
    
    # Backend can vary by host. Can be changed in virtual hosts' vcl_recv()
    set req.backend_hint = default;
}

# Include all website specific configuration:
include "all-vhosts.vcl";

# Include routines which will apply to every website unless "return" statement
# was used in in website specific configuration:
include "catch-all.vcl";
