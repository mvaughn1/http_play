var express = require('express')
var app = express()
var router = express.Router()

var txtResponse = "<html><body>hello...<br>";

// simple logger for this router's requests
// all requests to this router will first hit this middleware
router.use(function (req, res, next) {
  console.log('%s %s %s', req.method, req.url, req.path);
  txtResponse += "Your method is:<b>" + req.method + "</b><br>"
  txtResponse += "Your url is:" + req.url + "<br>";
  next()
})

// this will only be invoked if the path starts with /bar from the mount point
router.use('/bar', function (req, res, next) {
  // ... maybe some additional /bar logging ...
  
    txtResponse += "<br>you used bar<br>";
  next()
})

// always invoked
router.use(function (req, res, next) {
  txtResponse += "... thanks and bye.";
  res.send(txtResponse + "<br></body></html>")
})

app.use('/foo', router)

app.listen(3000)