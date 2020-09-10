# README

Steps to setup the project:

1. Clone git repo in your local

2. Run command: bundle install

3. rails db:create

4. rails db:migrate


List of APIs & Controllers:

1. Registration API - registrations_controller

2. Login/Logout APIs - sessions_controller

3. Follow/Unfollow APIs - relationships_controller

4. Create Tweet & List User's Tweet APIs - tweets_controller

5. Current User's Profile & Other User's Profile APIs - users_controller


List of APIs with headers & request parameters:

1. Registration API:\
    URL: localhost:3000/users\
    Method: POST\
    Headers:\
        Content-Type: application/json\
    Request Parameters in Body:\
        {\
            "user": {\
                "email": "user3@yopmail.com",\
                "password": "123456",\
                "password_confirmation": "123456"\
            }\
        }\
    Result:\
        {\
            "success": true,\
            "message": "Registration successful.",\
            "user": {\
                "id": 3,\
                "email": "user3@yopmail.com",\
                "auth_token": "m4eiy4s7wv_2TjaxUV23",\
                "created_at": "2020-09-10T09:22:41.246Z",\
                "updated_at": "2020-09-10T09:22:41.246Z"\
            }\
        }
2. Login API:\
    URL: localhost:3000/users/sign_in\
    Method: POST\
    Headers:\
        Content-Type: application/json\
    Request Parameters in Body:\
        {\
            "user": {\
                "email": "user3@yopmail.com",\
                "password": "123456"\
            }\
        }\
    Result:\
        {\
            "success": true,\
            "message": "Login successful.",\
            "data": {\
                "id": 3,\
                "email": "user3@yopmail.com",\
                "auth_token": "5dQi6vNEhCcFay1JpYsH"\
            }\
        }
3. Logout API:\
    URL: localhost:3000/users/sign_out\
    Method: DELETE\
    Headers:\
        Content-Type: application/json\
        Authorization: DPXxcPdnwvadmTGwTkZr\
    Request Parameters in Body: -\
    Result:\
        {\
            "success": true,\
            "message": "Logged out successfully. "\
        }
4. Follow an user API:\
    URL: localhost:3000/relationships\
    Method: POST\
    Headers:\
        Content-Type: application/json\
        Authorization: 5dQi6vNEhCcFay1JpYsH\
    Request Parameters in Body:\
        {\
            "followed_id": 1\
        }\
    Result:\
        {\
            "success": true,\
            "message": "Successfully followed this user.",\
            "data": {\
                "id": 5,\
                "follower_id": 3,\
                "followed_id": 1,\
                "created_at": "2020-09-10T10:24:44.726Z",\
                "updated_at": "2020-09-10T10:24:44.726Z"\
            }\
        }
5. Unfollow an user API:\
    URL: localhost:3000/relationships/2\
    Method: DELETE\
    Headers:\
        Content-Type: application/json\
        Authorization: 5dQi6vNEhCcFay1JpYsH\
    Request Parameters in Body: -\
    Result:\
        {\
            "success": true,\
            "message": "Successfully unfollowed this user.",\
            "data": {\
                "id": 5,\
                "follower_id": 3,\
                "followed_id": 1,\
                "created_at": "2020-09-10T10:24:44.726Z",\
                "updated_at": "2020-09-10T10:24:44.726Z"\
            }\
        }
6. Create a Tweet API:\
    URL: localhost:3000/tweets\
    Method: POST\
    Headers:\
        Content-Type: application/json\
        Authorization: 5dQi6vNEhCcFay1JpYsH\
    Request Parameters in Body:\
        {\
            "tweet": {\
                "content": "User 3 Tweet 2"\
            }\
        }\
    Result:\
        {\
            "id": 6,\
            "content": "User 3 Tweet 2",\
            "created_at": "2020-09-10T10:17:36.265Z",\
            "user": {\
                "id": 3,\
                "email": "user3@yopmail.com"\
            }\
        }
7. Listing tweets from user's followings API:
    URL: localhost:3000/tweets?user_id=1\
    Method: GET\
    Headers:\
        Content-Type: application/json\
        Authorization: 5dQi6vNEhCcFay1JpYsH\
    Request Parameters in Body: -\
    Result:\
        [\
            {\
                "id": 6,\
                "content": "User 3 Tweet 2",\
                "created_at": "2020-09-10T10:17:36.265Z",\
                "user": {\
                    "id": 3,\
                    "email": "user3@yopmail.com"\
                }\
            },\
            {\
                "id": 4,\
                "content": "User 2 Tweet 2",\
                "created_at": "2020-09-10T10:11:39.225Z",\
                "user": {\
                    "id": 2,\
                    "email": "user2@yopmail.com"\
                }\
            }\
        ]
8. User Profile API:
    URL: localhost:3000/users/3\
    Method: GET\
    Headers:\
        Content-Type: application/json\
        Authorization: 5dQi6vNEhCcFay1JpYsH\
    Request Parameters in Body: -\
    Result:\
        {\
            "id": 3,\
            "email": "user3@yopmail.com",\
            "followers": [\
                {\
                    "id": 1,\
                    "email": "user1@yopmail.com"\
                }\
            ],\
            "following": [\
                {\
                    "id": 1,\
                    "email": "user1@yopmail.com"\
                }\
            ]\
        }
9. Current Logged in User Profile API:
    URL: localhost:3000/users/profile\
    Method: GET\
    Headers:\
        Content-Type: application/json\
        Authorization: 5dQi6vNEhCcFay1JpYsH\
    Request Parameters in Body: -\
    Result:\
        {\
            "id": 1,\
            "email": "user1@yopmail.com",\
            "followers": [\
                {\
                    "id": 3,\
                    "email": "user3@yopmail.com"\
                }\
            ],\
            "following": [\
                {\
                    "id": 2,\
                    "email": "user2@yopmail.com"\
                },\
                {\
                    "id": 3,\
                    "email": "user3@yopmail.com"\
                }\
            ]\
        }
