# Me
---

Everything to do with the current user, uses `access-token` to find current user

### GET api/v1/me
This will return all information about the current user

here is an example request.

```
curl -GET http://localhost:3000/api/v1/me
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
```

The response from the server will be in a JSON format

``` json
{
    "id": 1,
    "first_name": "alan",
    "last_name": "kehoe",
    "email": "alankehoe111@gmail.com",
    "phone_no": null,
    "group_id": null,
    "permission_level": null,
    "username": "alan",
    "created_at": "2013-12-22T17:49:52.000Z",
    "updated_at": "2013-12-22T17:49:52.000Z"
}
```

### POST api/v1/me
Updates the current-user