import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

Future<String> getMyHeadline() async {

var response = await http.get(
// Encode the url
Uri.encodeFull('https://www.wunderground.com/weather/us/ca/san-diego/KCASANDI116'),
);
print('retrieved body');
var document = parse(response.body);
//var headlineElement = document.getElementsByClassName("banner-text screaming-banner-text banner-text-size--char-47");
//print(headlineElement);

var dogName = new List<Node>();
dogName = document.getElementsByClassName("wu-value wu-value-to");
String marko = 'current DelMark temp is ' + dogName[0].nodes.toString();

cnnBody = marko;
print('marko = ' + marko);
return marko;
}


final String MarkURL = "https://www.google.com/";

String cnnBody = 'data not retrieved yet';

void setthebody() async {

  //actually google now
  cnnBody = await getMyHeadline();
  await getCNNbody();
}

// Function to get the cnn page data
Future<void> getCNNbody() async {
  var response = await http.get(
    // Encode the url
    Uri.encodeFull(MarkURL),
  );
  // Logs the response body to the console
  String tempbody = response.body;
  print(response.statusCode);
  print('ran getCNNbody');
  //cnnBody = response.body;
  cnnBody = cnnBody + '\n\r  ' + tempbody.substring(0,100);
  print(DateTime.now().millisecondsSinceEpoch);

}

