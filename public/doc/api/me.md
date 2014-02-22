# Me
---

Everything to do with the current user, uses `access-token` to find current user

### GET v1/me
This will return all information about the current user

here is an example request.

```
curl -GET http://fleet-api.raven.com/v1/me
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
```

The response from the server will be in a JSON format

``` json
{
    "me": {
        "id": 1,
        "first_name": "alan",
        "last_name": "kehoe",
        "email": "alankehoe111@gmail.com",
        "username": "alan",
        "phone_no": "0870608580",
        "admin": true
    }
}
```

### PUT v1/me
Updates the current-user

```
curl -PUT http://fleet-api.raven.com/v1/me
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
    -d first_name=changeme
    -d last_name=changeme_to
    -d email=alankehoe111@gmail.com
    -d phone_no=0870608580
```

The server will respond with the updated me object

``` json
{
    "me": {
        "id": 1,
        "first_name": "changeme",
        "last_name": "changeme_to",
        "email": "alankehoe111@gmail.com",
        "username": "alan",
        "phone_no": "0870608580",
        "admin": true
    }
}
```

