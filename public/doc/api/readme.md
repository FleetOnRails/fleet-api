# FleetOnRails API

All API requests require authentication. You need to pass an `access_token` parameter by url.
How to get the `access_token` is defined in the [OAuth](/help/api/oauth) resource page.
If an invalid or no `access_token` is provided then a status code 401 will be returned:

API V1 requests should be prefixed with `api/v1`.

Example of a valid API request:

```
curl -GET http://fleet-api.raven.com/v1/me
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
```

The API uses JSON to serialize data. You don't need to specify `.json` at the end of API URL.

## Status codes

The API is designed to return different status codes according to context and action. In this way
if a request results in an error the caller is able to get insight into what went wrong, e.g.
status code `400 Bad Request` is returned if a required attribute is missing from the request.
The following list gives an overview of how the API functions generally behave.

##### API request types:

* `GET` requests access one or more resources and return the result as JSON
* `POST` requests return `201 Created` if the resource is successfully created
* `GET`, `PUT` and `DELETE` return `200 Ok` if the resource is accessed, modified or deleted successfully
* `DELETE` requests are designed to be idempotent, meaning resource still returns `200 Ok` even it was deleted before or is not available.
The reasoning behind it is the user is not really interested if the resource existed before or not.

##### The following list shows the possible return codes for API requests.

* `200 Ok` - The `GET`, `PUT` or `DELETE` request was successful, the resource(s) itself is returned as JSON
* `201 Created` - The `POST` request was successful and the resource is returned as JSON
* `400 Bad Request` - A required attribute of the API request is missing
* `401 Unauthorized` - The user is not authenticated, a valid user `access_token` is necessary, see above
* `403 Forbidden` - The request is not allowed, e.g. the user does not have the required permission level
* `404 Not Found` - A resource could not be accessed, e.g. an ID for a resource could not be found
* `500 Server Error` - While handling the request something went wrong on the server side