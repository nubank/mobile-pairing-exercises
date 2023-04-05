const express = require('express')
const app = express()
app.use(express.json())
const port = 3000

let db = {}

const hashCode = function(s) {
    var h = 0, l = s.length, i = 0;
    if ( l > 0 )
      while (i < l)
        h = (h << 5) - h + s.charCodeAt(i++) | 0;
    return h < 0 ? -h : h;
  };

app.post('/api/alias', (req, res) => {
    let longUrl = req.body.url
    if (!longUrl)
        res.status(400).send('Missing url parameter')
    else {
        let alias = `${hashCode(longUrl)}`
        db[alias] = longUrl
        res.status(200).json({ alias: alias, _links: {self: longUrl, short: `http://localhost:${port}/alias/${alias}`}})
    }
});

app.get('/api/alias/:id', (req, res) => {
    let alias = req.params.id
    if (!alias)
        res.status(400).send('Missing alias id parameter')
    else if (!db[alias])
        res.status(404).send('Not found')
    else
        res.status(200).json({url: db[alias]})
})

app.listen(port, () => { console.log(`Server running on port ${port}`)})
