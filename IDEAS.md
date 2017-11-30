## Ideas for later

* Generate VCL per host from simple flat config file, i.e.

```
error_html: /path/to/file.html
```

Would produce:

```cpp
sub vcl_error {
  set obj.http.Content-Type = "text/html; charset=utf-8";
  synthetic std.fileread("/path/to/file.html");
  return (deliver);
}
```
