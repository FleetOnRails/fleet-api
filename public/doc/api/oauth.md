# OAuth
---

All authentication for this API is handled through OAuth 2.0 with the doorkeeper gem.
This means for every API request a user has to submit an `access_token` in the params, this will
be used to authenticate the user on the system. For security OAuth access-tokens have an expiration time.
The length of this expiration time is currently set at 30 minutes.

### HTTPS
OAuth relies on a secure connection to protect parameters from attacks. However for our development
environment we wont be using HTTPS as the certs cost quite a bit of money :)
So be wary of sending passwords that may be the same as the password you use for Facebook, Google etc..

Below are the ways to fetch your `access_token`

---
### 1. With client credentials.
The first time you request the `access_token` you will use this method. the request contains the client
applications `client_id` and `client_secret` along with the clients `username` or `email` and the users
`password`.
##### N.B `grant_type` must be set to `password`
here is an example request.

```
curl -POST http://fleet-api.raven.com/oauth/token
    -d grant_type=password
    -d client_id=<CLIENT_ID>
    -d client_secret=<CLIENT_SECRET>
    -d email=<YOUR_EMAIL>
    -d password=<YOUR_PASSWORD>
```

The response from the server will be in a JSON format

``` json
{
    "access_token": "cd0620c063da6bbb501dd26de68f68982c8fea746b186a4e63b5275c1dce614c",
    "token_type": "bearer",
    "expires_in": 1800,
    "refresh_token": "557a0315680dac983e8cdb549e8584b276cee895348931d62b2b33d72177a5a2"
}
```

---

### 2. With refresh-token
The idea of refresh tokens is to give the user a way to re authenticate with the server without passing
there username and password across the wire. when a user authenticates with the server as in step one.
there is a `refresh_token` param, this parameter can be used like this.
##### N.B `grant_type` must be set to `refresh_token`
here is an example request.

```
curl -i http://fleet-api.raven.com/oauth/token
    -d grant_type=refresh_token
    -d client_id=<CLIENT_ID>
    -d client_secret=<CLIENT_SECRET>
    -d refresh_token=<REFRESH_TOKEN>
```

here is an example response

``` json
{
    "access_token": "cd0620c063da6bbb501dd26de68f68982c8fea746b186a4e63b5275c1dce614c",
    "token_type": "bearer",
    "expires_in": 1800,
    "refresh_token": "557a0315680dac983e8cdb549e8584b276cee895348931d62b2b33d72177a5a2"
}
```

## N.B refresh tokens are reset at every request.