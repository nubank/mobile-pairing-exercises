# URL Shortener

This exercise aims on creating a small application for creating and storing links of your favorite sites.  
In order to do this, you'll use an already implemented service that will handle all the backend logic, which is to accept the links and return an alias for it.

This application is composed of only one screen.
```
_________________________
|                       |
|     |TEXT FIELD|      |
|       (BUTTON)        |
|                       |
|         LIST          |
|      * ALIAS-1        |
|      * ALIAS-2        |
|      * ALIAS-3        |
|      * ALIAS-4        |
|      * ALIAS-5        |
|_______________________|
```

It has:
* One input text, that the user will use to write the link;
* One button which will trigger the action of sending this link to the service;
* A list with all available links/aliases.

## Base project

To allow you to focus on the more relevant parts of this app, we have base projects with some layers ready:
- iOS:
   - [Networking with Alamofire (and Cocoapods) set up](https://github.com/nubank/mobile-pairing-exercises/tree/master/url-shortener/ios/PairingBase-Alamofire%26Cocoapods);
   - [Networking with URLSession](https://github.com/nubank/mobile-pairing-exercises/tree/master/url-shortener/ios/PairingBase-URLSession);
- [Android](https://github.com/nubank/mobile-pairing-exercises/tree/master/url-shortener/android).


## API

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
   "alias" : "<url alias>",
   "_links" : {
     "self" : "<original url>"
     "short": "<short url>"
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
