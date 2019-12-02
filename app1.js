'use strict';
var http = require('http');
var url = require('url');

var port = process.env.PORT || 3000;
var mark1 = function (tempval) {

    console.log('Marko !!' + tempval);
 
}
http.createServer(function (req, res) {

    var strResponse = "<body> Your request info is: <br>";
    strResponse += " -- URL ---<br>"
    strResponse += req.url;
    strResponse += "<br> --header is<br>";
    strResponse += req.rawHeaders;
    strResponse += "<br> __ method was <br>";
    strResponse += req.method + " -----<br>";
    //text.toString() 
    strResponse += "<br>" + "-- end of Request --<br>";
    mark1(req.method);
    //console.log(strResponse + ' so that worked');
    console.log(req.rawHeaders);
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end(strResponse + '<br>Hello Mark</body>');
}).listen(port);
