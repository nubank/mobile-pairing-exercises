## URL Shortener API

The API is composed of

### Base Url: `https://url-shortener-nu.herokuapp.com`

### POST

A method for creating aliases with the following body:

- Url -> `/api/alias`
- Method -> `POST`
- Body:

``` json
{ "url": "<the url>" }
```

- Returns:


Status: 201 on success with the following body

```json
{
   "alias" : "<link alias>",
   "_links" : {
     "self" : "<this alias url>"
   }
}
```
### GET

A method for retrieving a link through an alias.

 - Url -> `/api/alias/:id`
 - Method -> `GET`
 - Returns: 

Status: 200 on success with the following body
 
 ```json
 { "url": "<the original url>" }
 ```
 
Status: 404 when not found

#### Base Url: `https://url-shortener-nu.herokuapp.com`
