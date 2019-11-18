import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String MarkURL = "https://www.google.com/";

String cnnBody = 'data not retrieved yet';

void setthebody() async {
  await getCNNbody();
}

// Function to get the cnn page data
Future<void> getCNNbody() async {
  var response = await http.get(
    // Encode the url
    Uri.encodeFull(MarkURL),
  );
  // Logs the response body to the console
  print(response.statusCode);
  print('ran getCNNbody');
  cnnBody = response.body;
  cnnBody = cnnBody.substring(0,100);
  print(DateTime.now().millisecondsSinceEpoch);

}

