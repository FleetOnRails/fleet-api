# Groups
---

### GET v1/groups
This will return all groups a user is a member of

Request

```
curl -GET http://fleet-api.raven.com/v1/groups
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
```

Response it the user has memberships.

``` json
{
    "groups": [
        {
            "group": {
                "id": 1,
                "name": "fleetonrails",
                "users": [
                    {
                        "id": 1,
                        "first_name": "alan",
                        "last_name": "kehoe",
                        "username": "alan",
                        "email": "alankehoe111@gmail.com"
                    }
                ]
            }
        }
    ]
}
```

Response it the user has no memberships.

``` json
{
    "groups": []
}
```

### GET v1/groups/:id
This will return the group with the id that matches :id, if a the current user is a member of that group

Request

```
curl -GET http://fleet-api.raven.com/v1/groups/1
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
```

Response if current user is a member of the requested group

``` json
{
    "group": {
        "id": 1,
        "name": "fleetonrails",
        "users": [
            {
                "id": 1,
                "first_name": "alan",
                "last_name": "kehoe",
                "username": "alan",
                "email": "alankehoe111@gmail.com"
            }
        ]
    }
}
```

Response if requested group does not exist

``` json
{
    "error": {
        "messages": [
            "Model not found"
        ]
    }
}
```

Response if current user is not a member of the requested group.

``` json
{
    "error": {
        "messages": [
            "Not privileged"
        ]
    }
}
```


### PUT v1/groups/:id
Updates the group with the id that matches :id current user must be a member of that group

```
curl -PUT http://fleet-api.raven.com/v1/users/1
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
    -d name=changeme
```

The server will respond with the updated group object

``` json
```

### POST v1/groups
Creates a new group, current user is automatically added to the new group.

```
curl -POST http://fleet-api.raven.com/v1/users
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
    -d name=cool_group
```

The server will respond with the new group object

``` json
{
    "group": {
        "id": 3,
        "name": "cool_group",
        "users": [
            {
                "id": 1,
                "first_name": "alan",
                "last_name": "kehoe",
                "username": "alan",
                "email": "alankehoe111@gmail.com"
            }
        ]
    }
}
```

### DELETE v1/users/:id
Deletes the group with an id matching :id, requires the current user to be a member of that group

```
curl -DELETE http://fleet-api.raven.com/v1/groups/3
    -d access_token=d5972e906db13298cf809fb15ab1950a79f61c97ddc9874f411c6ce04db3898b
```

The server will respond with the deleted group object

``` json
{
    "group": {
        "id": 3,
        "name": "cool_group",
        "users": []
    }
}
```
