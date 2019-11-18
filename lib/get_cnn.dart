import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';


final String MarkURL = "https://www.google.com/";
String MarkTempToDisplay = 'data not retrieved yet';

Future<String> getMyHeadline() async {
    var response = await http.get(
    // Encode the url
    Uri.encodeFull('https://www.wunderground.com/weather/us/ca/san-diego/KCASANDI116'),
    );
    print('retrieved body');
    var document = parse(response.body);
    var MarkTemp = new List<Node>();
    MarkTemp = document.getElementsByClassName("wu-value wu-value-to");
    String marko = MarkTemp[0].nodes.toString();
    marko = 'current DelMark temp is ' + marko.substring(2,4);
    //cnnBody = marko;
    print('marko = ' + marko);
    return marko;
}


//  **********   THIS IS CALLED FROM MAIN  ********
void setthebody() async {
  //actually google now
  MarkTempToDisplay = await getMyHeadline();
  //await getCNNbody();
}

// Function to get the cnn page data
/*  //no longer getting called...
  Future<void> getCNNbody() async {

  var response = await http.get(
    // Encode the url
    Uri.encodeFull(MarkURL),
  );
  // Logs the response body to the console
  String tempbody = response.body;
  //print(response.statusCode);
  print('ran getCNNbody');
  //cnnBody = response.body;
  cnnBody = cnnBody + '\n\r  ' + tempbody.substring(0,100);
  print(DateTime.now().millisecondsSinceEpoch);

}
*/
