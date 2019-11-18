import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

var document = parse(response.body);
var priceElement = document.getElementsByClassName("product_price_from");