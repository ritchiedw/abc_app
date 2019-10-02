import 'package:flutter/material.dart';

import 'address.dart';
import 'bin_route.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String postCode;
  String selectedUPRN;
  Map<String, String> uprnAddress = {};
  String binData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(
          0xff017cc1,
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Argyll and Bute Council'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                "Postcode",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            //PostcodeSearch(),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (newPostcode) {
                print(newPostcode);
                postCode = newPostcode;
              },
            ),
            FlatButton(
              onPressed: () {
                print("Search Postcode");
                getData();
              },
              child: Text("Search Postcode"),
              color: Color(0xff1db15b),
            ),
            Container(
              height: 50.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10.0),
              color: Colors.lightBlue,
              child: androidDropdown(),
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10.0),
              child: binDetails(),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> androidDropdown() {
    print('androidDropdown');
    List<DropdownMenuItem<String>> dropdownItems = [];
    uprnAddress.forEach((k, v) {
      var newItem = DropdownMenuItem(
        child: Text(v),
        value: k,
      );
      dropdownItems.add(newItem);
    });

    return DropdownButton<String>(
      value: selectedUPRN,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedUPRN = value;
          print("dropdown button set state");
          //getData();
          getBinData();
          //savePreference();
        });
      },
    );
  }

  Widget binDetails() {
    List<String> details = binData.split(',');
    List<String> condensed;
    String temp = '';

    for(int i = 0; i<details.length; i++) {
      if(i%2 == 0) {
        temp += details[i];
      } else {
        condensed.add(temp += ': ${details[i]}');
        temp = '';
      }
    }
    //return Column(
    //  children: <Widget>[],
    //); //Container(Text(binData));
    return Expanded( 
      child: ListView.builder(
        itemCount: condensed.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return new Text(condensed.elementAt(index));
        },
      ),
    );
  }

  void getBinData() async {
    BinRoute binRoute = BinRoute();
    binData = await binRoute.getBinRouteFromUPRN(selectedUPRN);
    setState(() {});
  }

  void getData() async {
    //Map<String, String> uprnAddress = {};
    Address address = Address();
    List<dynamic> addressList = await address.getAddressFromPostcode(postCode);
    //print(addressList);
    print(addressList[0]);
    selectedUPRN = addressList[0]['attributes']['UPRN'];
    addressList.forEach((element) {
      print(element['attributes']['ADDRESS']);
      print(element['attributes']['UPRN']);
      String uprn = element['attributes']['UPRN'];
      String someAddress = element['attributes']['ADDRESS'];
      uprnAddress.putIfAbsent(uprn, () => someAddress.substring(0, 30));
    });
    setState(() {});
    print(uprnAddress);
  }
}
