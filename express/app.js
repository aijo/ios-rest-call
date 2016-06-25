var express = require('express');
var moment = require('moment');
var bodyParser = require('body-parser');
var app = express();

var itemList = [];

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended:true }));

app.get('/', function (req, res) {
    res.send('Hello World!');
});

app.get('/today', function (req, res) {
    res.send({
      "today": moment().locale("th").format('DD MMM YYYY')
    });
});

app.get('/echo/:param', function (req, res) {
    var result = {};
    if (req.params != null) {
      result["param"] = req.params.param
    }
    if (req.query != null) {
      result["queryParam"] = req.query.queryParam
    }
    if (req.body != null) {
      result["bodyParam"] = req.body.bodyParam
    }
    res.send(result);
});

app.post('/login', function (req, res) {
    if (req.body.username == "nida" && req.body.password == "asnida") {
      res.send({"result":true});
    } else {
      res.send({"result":false});
    }
});

app.post('/addItem', function (req, res) {
    if (req.body.title != null && req.body.content != null) {
      console.log({title: req.body.title, content: req.body.content});
      itemList.push({title: req.body.title, content: req.body.content});
      res.send({"result":true});
    } else {
      res.send({"result":false});
    }
});

app.get('/getItems', function (req, res) {
    res.send(itemList);
});

app.listen(8080, function () {
    console.log('Listening on port 8080!');
});
