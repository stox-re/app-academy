# Hypertext transfer protocol

# --- Http Request ---
GET /cats HTTP/1.1
Host: mycoolsite.com
Accept-Language: en

# --- Http response ---
HTTP/1.1 200 OK
Content-Length: 32
Content-Type: text/html

<html>
...
</html>

# Using nc
nc example.com 80
GET / HTTP/1.1
Host: example.com

