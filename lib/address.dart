import 'dart:convert';

import 'example_json.dart';

class Address {
  String postcode;
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String addressLine4;

  String url =
      "https://arcgis.argyll-bute.gov.uk/arcgis/rest/services/CAG_and_Council_Property/MapServer/0/query?text=";
  String endUrl = "&outFields=ADDRESS%2C+UPRN&f=pjson";

  List<String> addresses = [];

  Future getAddressFromPostcode(String postcode) async {
    print("getAddressFromPostcode()");

    String requestURL = '$url${postcode.toUpperCase()}$endUrl';
    print(requestURL);

    ExampleJson ej = ExampleJson();
    var decodedData = jsonDecode(ej.json);
    var features = decodedData['features'];
    print(features.runtimeType);
    print(decodedData['features']);
    return (decodedData['features']);
  }
}
