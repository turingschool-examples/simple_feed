SimpleFeed
----------

Run `bundle` then `bundle exec rake boot` before running the app.

Add `127.0.0.1  simplefeed.dev` to your `/etc/hosts` file, and use port 2999 when running the app: `bundle exec rails server -p2999`

## API Documentation

The following sections describe the API endpoints provided by the SimpleFeed system. All endpoints return JSON-formatted data and are protected by HTTP Basic Authorization that requires a valid username and password combo from an existing user.

### List Stream of All Feeds

API Endpoint: `http://simplefeed.dev:2999/api/feeds/items.json`

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


