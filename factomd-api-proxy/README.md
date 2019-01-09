# Factomd API Proxy

A lightweight proxy, custom-built to enhance the factomd API port.

##Features:

* **CORS support:** Full, spec-compliant functionality, including wildcard support and
regular expression syntax for specifying allowed origins.

* **Health check support:** The `GET /` path returns a `200 OK`, which allows the API to
work correctly with cloud provider infrastructure, such as the GCP HTTP load balancer.

* **Strict protocol operation:** Only a very narrow range of HTTP verbs and URIs are
passed through to factomd, increasing security.

## Useful Links
      
  * [Base Image](https://hub.docker.com/r/openresty/openresty/)
  
  * [Lua Patterns](https://www.lua.org/pil/20.2.html)

## Supported tags and Dockerfile links

* [`latest` (*Dockerfile*)](https://github.com/BedrockSolutions/dockerfile/blob/master/factomd-api-proxy/Dockerfile)
  
## Environment variables

The image can accept three, optional, environment variables:

* **`ALLOW_ORIGIN`:** Configures CORS. Three modes of operation are supported:

  * `""`: Disables CORS. This is the default
  
  * `"*"`: Enables CORS in wildcard mode. This will allow all browsers to use
  the API.
  
  * `"<lua pattern>"`: Enables CORS only for origins that match the Lua pattern.
  Some examples:
  
    * `^http://www%.foo%.com$`: Exact match of one domain
    
    * `^https?://.*foo%.com$`: Matches all origins ending in `foo.com`. Both http
    and https URLs match.
    
    * `^https://www%.(foo|bar)%.com$`: Matches either `https://www.foo.com` or
    `https://www.bar.com`.

* **`API_PORT`:** The API port on the factomd instance. Defaults to `8088`.

* **`PORT`:** The port the proxy will listen on. Defaults to `8087`.
