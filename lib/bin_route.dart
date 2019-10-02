import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class BinRoute {
//https://ssdlive.argyll-bute.gov.uk:8443/binuplift/api/web/properties/uprn/000125029348
  String $responseXML = """
  <response>
    <item>
      <route>LOM01</route>
      <wastetype>Recycling</wastetype>
      <collectiontype>Domestic</collectiontype>
      <collectiondate>2019-09-30</collectiondate>
      <ruid>2042</ruid>
      <calyear>2018/2019</calyear>
    </item>
    <item>
      <route>LOM01</route>
      <wastetype>Glass</wastetype>
      <collectiontype>Domestic</collectiontype>
      <collectiondate>2019-09-30</collectiondate>
      <ruid>2043</ruid>
      <calyear>2018/2019</calyear>
    </item>
    <item>
      <route>LOM01</route>
      <wastetype>Food</wastetype>
      <collectiontype>Domestic</collectiontype>
      <collectiondate>2019-09-30</collectiondate>
      <ruid>2044</ruid>
      <calyear>2018/2019</calyear>
    </item>
  </response>
  """;

  String url = "https://www.argyll-bute.gov.uk/";

  Future getBinRouteFromUPRN(String uprn) async {
    //
    String requestURL = '$url$uprn';

    var document = xml.parse($responseXML);

    var items = document.findAllElements('item');

    //document.

    String output = "";

    items.forEach((node) {
      print("foreach\n");
      var wastetype = node.findElements('wastetype');
      var collectiondate = node.findElements('collectiondate');
      print(wastetype.first.text);
      output += '${wastetype.first.text},${collectiondate.first.text},';
    });

    print(output);

    return Future.delayed(Duration(seconds: 1), () => output);
  }
}
