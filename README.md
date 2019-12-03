# Url Shortener Code Test

Without using an external database, we'd like you to create a URL shortening
service. The URLs do not need to persist between restarts, but should be
shareable between different clients while the server is running.

- There should be an endpoint that responds to `POST` with a json body
  containing a URL, which responds with a JSON repsonse of the short url and
  the orignal URL, as in the following curl example:

```
curl localhost:4000 -XPOST -d '{ "url": "http://www.farmdrop.com" }'
{ "short_url": "/abc123", "url": "http://www.farmdrop.com" }
```


- When you send a GET request to a previously returned URL, it should redirect
  to the POSTed URL, as shown in the following curl example:

```
curl -v localhost:4000/abc123
...
< HTTP/1.1 301 Moved Permanently
...
< Location: http://www.farmdrop.com
...
{ "url": "http://www.farmdrop.com" }
```

Use whatever languages and frameworks you are comfortable with. Don't worry
about getting the whole thing working flawlessly, this is more to see how you
structure a program. Please don't spend more than a few hours on it.

Bonus points:

- I often forget to type "http://" at the start of a URL. It would be nice if
  this was handled by the application (frontend or backend is up to you).
- We like to see how you approach the problem, so a few git commits with a
  clear message about what you're doing are better than one git commit with
  everything in it.
- We like tests. We don't expect a full test suite, but some tests would be
  nice to see. Its up to you whether thats integration, unit or some other
  level of testing.
- We'd be very happy to see a Dockerfile to run the project. This by no means a
  requirement, so don't go reading the Docker docs if you've never worked with
  it.
- If you'd like to show off your frontend skills, you could create a simple
  frontend that can create and display shortened URLs without reloading the
  page.

## To run

1. Clone this repository
2. Run ```bundle install``` to get the necessary gems
3. Fire up Sinatra with ```ruby app.rb```
4. Enter a URL to be shortened in the command line: for example ```curl localhost:4567 -XPOST -d '{ "url": "http://www.farmdrop.com" }'```. Or visit localhost:4567 in a browser, which will display a list of shortened links (if any) from the same session.
