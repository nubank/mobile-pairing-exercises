# Encurtador de URL

O objetivo desse exercício é criar uma pequena aplicação para encurtar e guardar link dos seus sites favoritos.
Você vai usar um serviço, já implementado, que lida com toda a lógica de backend de aceitar um link e retornar um alias para ele.

A aplicação é composta por apenas uma tela:

```
_________________________
|                       |
|    |CAMPO DE TEXTO|   |
|       (BOTÃO)         |
|                       |
|         LISTA         |
|      * ALIAS-1        |
|      * ALIAS-2        |
|      * ALIAS-3        |
|      * ALIAS-4        |
|      * ALIAS-5        |
|_______________________|
```

Essa tela contém:
* Um campo de texto onde o usuário digita um link;
* Um botão para a ação de enviar o link para o serviço;
* Uma lista com todos os links/alias disponíveis.

## API

A API é composta por:

### URL base: `https://url-shortener-nu.herokuapp.com`

### POST

Método para criação de alias a partir de um link:

- Url -> `/api/alias`
- Método -> `POST`
- Body:

``` json
{ "url": "<link digitado>" }
```

- Responde:


Status: 201 no sucesso com o seguinte body:

```json
{
   "alias" : "<alias do link>",
   "_links" : {
     "self" : "<o link originário desse alias>"
   }
}
```
### GET

Método para pegar um link a partir de um alias

 - Url -> `/api/alias/:id`
 - Método -> `GET`
 - Responde:

Status: 200 no sucesso com o seguinte body:

 ```json
 { "url": "<o link original>" }
 ```

Status: 404 quando não for encontrado
