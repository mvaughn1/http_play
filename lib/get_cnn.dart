import 'package:http/http.dart' as http;

final String MarkURL = "https://www.google.com/";

String cnnBody = 'data not retrieved yet';

// Function to get the cnn page data
Future<String> getCNNbody() async {
  var response = await http.get(
    // Encode the url
    Uri.encodeFull(MarkURL),
  );
  // Logs the response body to the console
  print(response.statusCode);
  print(response.body);
  cnnBody = response.body;
  return cnnBody;

}

