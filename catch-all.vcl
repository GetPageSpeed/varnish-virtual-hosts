# You may want to include your PURGE handler in this file!

# This function is used when a request is received from our backend
sub vcl_backend_response {
    # Parse ESI request and remove Surrogate-Control header
    if (beresp.http.Surrogate-Control ~ "ESI/1.0") {
        unset beresp.http.Surrogate-Control;
        set beresp.do_esi = true;
    }

    # Remove some headers we never want to see
    unset beresp.http.Server;
    unset beresp.http.X-Powered-By;
}