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
        "phone_no": null,
        "admin": true,
        "cars": [
            {
                "id": 10,
                "make": "toyota",
                "model": "corolla",
                "registration": "05wx11013"
            },
            {
                "id": 11,
                "make": "bmw",
                "model": "520i",
                "registration": "09wx3289"
            }
        ],
        "groups": [
            {
                "id": 1,
                "name": "fleetonrails"
            }
        ]
    }
}
```

### PUT v1/me
Updates the current-user

``` json
{
	"me": {
		"first_name":"alan",
        "last_name":"kehoe",
      	"phone_no":"0870608580",
      	"avatar_extension":".jpg",
      	"avatar_data":"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"
	}
}
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
        "phone_no": null,
        "admin": true,
        "cars": [
            {
                "id": 10,
                "make": "toyota",
                "model": "corolla",
                "registration": "05wx11013"
            },
            {
                "id": 11,
                "make": "bmw",
                "model": "520i",
                "registration": "09wx3289"
            }
        ],
        "groups": [
            {
                "id": 1,
                "name": "fleetonrails"
            }
        ]
    }
}
```

