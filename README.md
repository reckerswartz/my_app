# README


## Test it out

Launch the app

[demomyappl](https://demomyappl.herokuapp.com/urls.json)


Create a new index from Url

Eg:- h1 h2 ...  content from https://github.com
```bash
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"urls", "attributes":{"url":"https://github.com"}}}' https://demomyappl.herokuapp.com/urls
```

You can now query all one of your content

```bash
curl -i -H "Accept: application/vnd.api+json" "https://demomyappl.herokuapp.com/urls"
```


