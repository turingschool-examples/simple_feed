SimpleFeed
----------

Run `bundle` then `bundle exec rake boot` before running the app.

Add `127.0.0.1  simplefeed.dev` to your `/etc/hosts` file, and use port 2999 when running the app: `bundle exec rails server -p2999`

## API Documentation

The following sections describe the API endpoints provided by the SimpleFeed system. All endpoints return JSON-formatted data and are protected by HTTP Basic Authorization that requires a valid username and password combo from an existing user.

### List Stream of All Feeds

API Endpoint: `http://simplefeed.dev:2999/api/feeds/items.json`

HTTP verb: GET

**Purpose:** Provides a paginated list of items from all feeds in the system, organized in reverse-chronological order.

#### Request-Response Headers

Request-response headers lacking valid HTTP basic authorization credentials:

    GET /feeds/items.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json

    HTTP/1.1 401 Unauthorized
    WWW-Authenticate: Basic realm="Application"
    Content-Type: text/html; charset=utf-8
    Cache-Control: no-cache
    Content-Length: 0
    Date: Fri, 18 May 2012 16:57:35 GMT
    Connection: Keep-Alive

Request-reponse headers including valid HTTP basic authorization credentials:

    GET /feeds/items.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json
    Authorization: Basic <Base 64-encoded credentials>

    HTTP/1.1 200 OK
    Link: <http://simplefeed.dev:2999/api/feeds/items?page=2>; rel="next", <http://simplefeed.dev:2999/api/feeds/items?page=5>; rel="last"
    Content-Type: application/json; charset=utf-8
    Etag: "bdd3af8bd48ef90b95a4016025721129"
    Cache-Control: max-age=0, private, must-revalidate
    Content-Length: 2075
    Date: Fri, 18 May 2012 17:05:44 GMT
    Connection: Keep-Alive

    [
      {
        type: "ImageItem",
        image_url: "http://cdn2.funnycorner.net/funny-pictures/6177/funny-cat-and-computer-mouse.jpg",
        text: "Cats are kinda dumb.",
        id: 41,
        created_at: "2012-05-15T12:01:01Z",
        link: "http://simplefeed.dev:2999/api/feeds/j3/items/41.json",
        feed: {
          link: "http://simplefeed.dev:2999/api/feeds/j3.json",
          name: "j3"
        },
        user: {
          username: "j3",
          email: "jeff@jumpstartlab.com",
          gravatar: "http://www.gravatar.com/avatar/3158320fc892baab27674fa756788ae2?s=40"
        }
      },
      {
        type: "LinkItem",
        link_url: "http://hungryacademy.com/",
        text: "I hear this place has some cool people in it.",
        id: 40,
        created_at: "2012-05-15T12:01:01Z",
        link: "http://simplefeed.dev:2999/api/feeds/mattyoho/items/40.json",
        feed: {
          link: "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
          name: "mattyoho"
        },
        user: {
          username: "mattyoho",
          email: "matt.yoho@livingsocial.com",
          gravatar: "http://www.gravatar.com/avatar/6c95c21f44000498a8f1b1e7639d7720?s=40"
        }
      },
      {
        type: "LinkItem",
        link_url: "http://hungryacademy.com/",
        text: "I teach here!",
        id: 39,
        created_at: "2012-05-15T12:01:01Z",
        link: "http://simplefeed.dev:2999/api/feeds/j3/items/39.json",
        feed: {
          link: "http://simplefeed.dev:2999/api/feeds/j3.json",
          name: "j3"
        },
        user: {
          username: "j3",
          email: "jeff@jumpstartlab.com",
          gravatar: "http://www.gravatar.com/avatar/3158320fc892baab27674fa756788ae2?s=40"
        }
      },
      {
        type: "TextItem",
        text: "Copy and paste is not a software design principle.",
        id: 38,
        created_at: "2012-05-15T12:01:01Z",
        link: "http://simplefeed.dev:2999/api/feeds/mattyoho/items/38.json",
        feed: {
          link: "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
          name: "mattyoho"
        },
        user: {
          username: "mattyoho",
          email: "matt.yoho@livingsocial.com",
          gravatar: "http://www.gravatar.com/avatar/6c95c21f44000498a8f1b1e7639d7720?s=40"
        }
      }
    ]

### Show Feed Details

API Endpoint: `http://simplefeed.dev:2999/api/feeds/<feed_name>.json`

HTTP verb: GET

**Purpose:** Shows details for a single feed, including the more recent items.

#### Request-Response Headers

Request-response headers lacking valid HTTP basic authorization credentials:

    GET /feeds/mattyoho.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json

    HTTP/1.1 401 Unauthorized
    WWW-Authenticate: Basic realm="Application"
    Content-Type: text/html; charset=utf-8
    Cache-Control: no-cache
    Content-Length: 0
    Date: Fri, 18 May 2012 17:57:35 GMT
    Connection: Keep-Alive

Request-reponse headers including valid HTTP basic authorization credentials:

    GET /feeds/mattyoho.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json
    Authorization: Basic <Base 64-encoded credentials>

    HTTP/1.1 200 OK
    Content-Type: application/json; charset=utf-8
    Etag: "cdd3af8bd48efa0b95a4016025721122"
    Cache-Control: max-age=0, private, must-revalidate
    Content-Length: 2075
    Date: Fri, 18 May 2012 17:58:44 GMT
    Connection: Keep-Alive

    {
      name: "mattyoho",
      id: 1,
      created_at: "2012-05-15T12:01:00Z",
      user: {
        username: "mattyoho",
        email: "matt.yoho@livingsocial.com",
        gravatar: "http://www.gravatar.com/avatar/6c95c21f44000498a8f1b1e7639d7720?s=40"
      },
      link: "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
      items: {
        link: "http://simplefeed.dev:2999/api/feeds/mattyoho/items.json",
        pages: 3,
        first_page: "http://simplefeed.dev:2999/api/feeds/mattyoho/items.json?page=1",
        last_page: "http://simplefeed.dev:2999/api/feeds/mattyoho/items.json?page=3",
        most_recent: [
          {
            type: "TextItem",
            text: "This is from the API, a fifth time.",
            id: 47,
            created_at: "2012-05-15T12:47:56Z",
            feed: "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
            link: "http://simplefeed.dev:2999/api/feeds/mattyoho/items/47.json"
          },
          {
            type: "TextItem",
            text: "This is from the API, a fourth time.",
            id: 46,
            created_at: "2012-05-15T12:47:30Z",
            feed: "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
            link: "http://simplefeed.dev:2999/api/feeds/mattyoho/items/46.json"
          },
          {
            type: "TextItem",
            text: "This is from the API, thrice.",
            id: 45,
            created_at: "2012-05-15T12:46:00Z",
            feed: "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
            link: "http://simplefeed.dev:2999/api/feeds/mattyoho/items/45.json"
          },
          {
            type: "TextItem",
            text: "This is from the API, too.",
            id: 44,
            created_at: "2012-05-15T12:43:53Z",
            feed: "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
            link: "http://simplefeed.dev:2999/api/feeds/mattyoho/items/44.json"
          },
          {
            type: "TextItem",
            text: "This is from the API.",
            id: 43,
            created_at: "2012-05-15T12:42:15Z",
            feed: "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
            link: "http://simplefeed.dev:2999/api/feeds/mattyoho/items/43.json"
          }
        ]
      },
      web_url: "http://simplefeed.dev:2999/feeds/mattyoho"
    }

### List Feed's Items

API Endpoint: `http://simplefeed.dev:2999/api/feeds/<feed_name>/items.json`

HTTP verb: GET

**Purpose:** Provides a paginated list of items from a single named feed in the system, organized in reverse-chronological order.

#### Request-Response Headers

Request-response headers lacking valid HTTP basic authorization credentials:

    GET /feeds/mattyoho/items.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json

    HTTP/1.1 401 Unauthorized
    WWW-Authenticate: Basic realm="Application"
    Content-Type: text/html; charset=utf-8
    Cache-Control: no-cache
    Content-Length: 0
    Date: Fri, 18 May 2012 16:57:35 GMT
    Connection: Keep-Alive

Request-reponse headers including valid HTTP basic authorization credentials:

    GET /feeds/mattyoho/items.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json
    Authorization: Basic <Base 64-encoded credentials>

    HTTP/1.1 200 OK
    Link: <http://simplefeed.dev:2999/api/feeds/mattyoho/items?page=2>; rel="next", <http://simplefeed.dev:2999/api/feeds/mattyoho/items?page=5>; rel="last"
    Content-Type: application/json; charset=utf-8
    Etag: "cdd3af8bd48efa0b95a4016025721122"
    Cache-Control: max-age=0, private, must-revalidate
    Content-Length: 2075
    Date: Fri, 18 May 2012 17:35:44 GMT
    Connection: Keep-Alive

    [
      {
        type: "LinkItem",
        link_url: "http://hungryacademy.com/",
        text: "I hear this place has some cool people in it.",
        id: 40,
        created_at: "2012-05-15T12:01:01Z",
        link: "http://simplefeed.dev:2999/api/feeds/mattyoho/items/40.json",
        feed: {
          link: "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
          name: "mattyoho"
        },
        user: {
          username: "mattyoho",
          email: "matt.yoho@livingsocial.com",
          gravatar: "http://www.gravatar.com/avatar/6c95c21f44000498a8f1b1e7639d7720?s=40"
        }
      },
      {
        type: "TextItem",
        text: "Copy and paste is not a software design principle.",
        id: 38,
        created_at: "2012-05-15T12:01:01Z",
        link: "http://simplefeed.dev:2999/api/feeds/mattyoho/items/38.json",
        feed: {
          link: "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
          name: "mattyoho"
        },
        user: {
          username: "mattyoho",
          email: "matt.yoho@livingsocial.com",
          gravatar: "http://www.gravatar.com/avatar/6c95c21f44000498a8f1b1e7639d7720?s=40"
        }
      }
    ]

### Create Feed Item

API Endpoint: `http://simplefeed.dev:2999/api/feeds/<feed_name>/items.json`

HTTP verb: POST

**Purpose:** Creates a new item for the given feed. The `type` value must be `"TextItem"`, `"ImageItem"`, or `"LinkItem"`.

The credentials must match to the owner of the given feed. The request body should contain parameters in JSON format.

#### Request-Response Headers

Request-response headers lacking valid HTTP basic authorization credentials:

    POST /feeds/mattyoho/items.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json
    Content-Type: application/json

    HTTP/1.1 401 Unauthorized
    WWW-Authenticate: Basic realm="Application"
    Content-Type: text/html; charset=utf-8
    Cache-Control: no-cache
    Content-Length: 0
    Date: Fri, 18 May 2012 16:57:35 GMT
    Connection: Keep-Alive

Request-response headers with valid HTTP basic authorization credentials that do not match the feed owner:

    POST /feeds/mattyoho/items.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json
    Content-Type: application/json
    Authorization: Basic <Base 64-encoded credentials>

    HTTP/1.1 403 Forbidden
    Content-Type: application/json; charset=utf-8
    Cache-Control: no-cache
    Content-Length: 0
    Date: Fri, 18 May 2012 16:57:35 GMT
    Connection: Keep-Alive

Request-reponse headers including valid HTTP basic authorization credentials for the feed owner:

    POST /feeds/mattyoho/items.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json
    Content-Type: application/json
    Authorization: Basic <Base 64-encoded credentials>

    {"type" : "TextItem", "body" : "Moo, I'm a dog."}

    HTTP/1.1 204 NO CONTENT
    Content-Type: application/json; charset=utf-8
    Etag: "cdd3af8bd48efa0b95a4016025721122"
    Date: Fri, 18 May 2012 17:35:44 GMT
    Connection: Keep-Alive

    {
      "type" : "TextItem",
      "text" : "Moo, I'm a dog.",
      "id" : 50,
      "created_at" : "2012-05-18T20:32:48Z",
      "link" : "http://simplefeed.dev:2999/api/feeds/mattyoho/items/50.json",
      "feed" : {
        "link" : "http://simplefeed.dev:2999/api/feeds/mattyoho.json",
        "name" : "mattyoho"
      },
      "user" : {
        "username" : "mattyoho",
        "email" : "matt.yoho@livingsocial.com",
        "gravatar" : "http://www.gravatar.com/avatar/6c95c21f44000498a8f1b1e7639d7720?s=40"
      }
    }

### Update Feed Item

API Endpoint: `http://simplefeed.dev:2999/api/feeds/<feed_name>/items/<item_id>.json`

HTTP verb: PUT

**Purpose:** Updates the details for a given feed item.

The credentials must match to the owner of the given feed. The request body should contain parameters in JSON format. It's not possible to change the type of the item.

#### Request-Response Headers

Request-response headers lacking valid HTTP basic authorization credentials:

    POST /feeds/mattyoho/items/50.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json
    Content-Type: application/json

    HTTP/1.1 401 Unauthorized
    WWW-Authenticate: Basic realm="Application"
    Content-Type: text/html; charset=utf-8
    Cache-Control: no-cache
    Content-Length: 0
    Date: Fri, 18 May 2012 16:57:35 GMT
    Connection: Keep-Alive

Request-response headers with valid HTTP basic authorization credentials that do not match the feed owner:

    POST /feeds/mattyoho/items/50.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json
    Content-Type: application/json
    Authorization: Basic <Base 64-encoded credentials>

    HTTP/1.1 403 Forbidden
    Content-Type: application/json; charset=utf-8
    Cache-Control: no-cache
    Content-Length: 0
    Date: Fri, 18 May 2012 16:57:35 GMT
    Connection: Keep-Alive

Request-reponse headers including valid HTTP basic authorization credentials for the feed owner:

    POST /feeds/mattyoho/items/50.json HTTP 1.1
    Host: simplefeed.dev:2999
    Accept: application/json
    Content-Type: application/json
    Authorization: Basic <Base 64-encoded credentials>

    {"body" : "Moo, I'm a dog."}

    HTTP/1.1 204 NO CONTENT
    Content-Type: application/json; charset=utf-8
    Etag: "cdd3af8bd48efa0b95a4016025721122"
    Date: Fri, 18 May 2012 17:35:44 GMT
    Connection: Keep-Alive

The API can be interacted with using the (SimpleFeed client gem)[https://github.com/JumpstartLab/simple_feed_client].
