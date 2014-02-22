# Users
---

### GET v1/users
This will return all users in the database

Request

```
curl -GET http://fleet-api.raven.com/v1/users
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
```

Response

``` json
{
    "users": [
        {
            "user": {
                "id": 1,
                "first_name": "alan",
                "last_name": "kehoe",
                "email": "alankehoe111@gmail.com",
                "username": "alan",
                "phone_no": "0870608580",
                "admin": true
            }
        },
        {
            "user": {
                "id": 2,
                "first_name": "krystian",
                "last_name": "jankowski",
                "email": "krystian.jankowski2@mail.dcu.ie",
                "username": "krystian",
                "phone_no": null,
                "admin": false
            }
        }
    ]
}
```

### GET v1/users/:id
This will return the user with the id that matches :id

Request

```
curl -GET http://fleet-api.raven.com/v1/users/1
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
```

Response

``` json
{
    "user": {
        "id": 1,
        "first_name": "alan",
        "last_name": "kehoe",
        "email": "alankehoe111@gmail.com",
        "username": "alan",
        "phone_no": "0870608580",
        "admin": false
    }
}
```


### PUT v1/users/:id
Updates the user with the id that matches :id requires admin privileges

```
curl -PUT http://fleet-api.raven.com/v1/users/1
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
    -d first_name=changeme
    -d last_name=changeme_to
    -d email=alankehoe111@gmail.com
    -d phone_no=0870608580
    -d admin=true
```

The server will respond with the updated user object

``` json
{
    "user": {
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

### POST v1/users
Creates a new user, is not protected with Doorkeeper OAuth this it to allow users to sign up.

```
curl -PUT http://fleet-api.raven.com/v1/users
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
    -d first_name=joe
    -d last_name=bloggs
    -d email=joe.bloggs@email.com
    -d username=joe.bloggs
    -d phone_no=123456789
```

The server will respond with the new user object

``` json
{
    "user": {
        "id": 10,
        "first_name": "joe",
        "last_name": "bloggs",
        "email": "joe.bloggs@email.com",
        "username": "joe.bloggs",
        "phone_no": "123456789",
        "admin": false
    }
}
```

### DELETE v1/users/:id
Deletes a user with an id matching :id, requires current user to have admin privileges

```
curl -DELETE http://fleet-api.raven.com/v1/users/10
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
```

The server will respond with the deleted user object

``` json
{
    "user": {
        "id": 10,
        "first_name": "joe",
        "last_name": "bloggs",
        "email": "joe.bloggs@email.com",
        "username": "joe.bloggs",
        "phone_no": "123456789",
        "admin": false
    }
}
```
