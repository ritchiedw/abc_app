import 'package:abc_app/bin_tile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  //String binData = "";
  List<BinTile> binData = List();
  TextEditingController tec = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("initState");
    doAsyncInitStuff();
  }

  void doAsyncInitStuff() {
    print("doAsyncInitStuff");
    Future<String> savedPostcodeFuture = getPreference('postCode');
    savedPostcodeFuture.then((result) {
      if (result != 'Not Defined') {
        tec.text = result;
        postCode = result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String savedPostcode;

    //tec.addListener(() => {});
    //Future<String> savedPostcodeFuture = getPreference('postCode');
    //savedPostcodeFuture.then((savedPostcodeFuture) {
    //  print(savedPostcodeFuture);
    //  if (savedPostcodeFuture != 'Not Defined') {
    //    tec.text = savedPostcodeFuture;
    //  }
    //});

    return DefaultTabController(
      length: 1,
      child: Scaffold(
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
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bin Calendar Lookup Page",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: tec,
                      textAlign: TextAlign.center,
                      onChanged: (newPostcode) {
                        print(newPostcode);
                        postCode = newPostcode;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        //icon: Icon(
                        //  Icons.location_searching,
                        //  color: Colors.white,
                        //),
                        hintText: "Enter Postcode",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      print("Search Postcode");
                      FocusScope.of(context).requestFocus(FocusNode());
                      getData();
                      savePreference("postCode", postCode);
                    },
                    child: Text("Search Postcode"),
                    color: Color(0xff1db15b),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 10.0),
                    //color: Colors.lightBlue,
                    child: androidDropdown(),
                  ),
                  Expanded(
                    //height: 150.0,
                    //alignment: Alignment.center,
                    //padding: EdgeInsets.only(bottom: 10.0),
                    child: binDetails(),
                  ),
                ],
              ),
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

  void savePreference(String name, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(name, value);
  }

  Future<String> getPreference(String name) async {
    print("getDetails()");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String detail = prefs.getString(name) ?? 'Not Defined';
    return detail;
  }

  Widget binDetails() {
    print('binDetails');
    print(binData.runtimeType);
    if (binData == null || binData == '') {
      return Container();
    }

    //List<String> details = binData.split(',');
    //List<String> condensed = List();
    //String temp = '';

    //for (int i = 0; i < details.length; i++) {
    //  if (i % 2 == 0) {
    //    temp += details[i];
    //  } else {
    //    condensed.add(temp += ': ${details[i]}');
    //    temp = '';
    //  }
    //}
    //return Column(
    //  children: <Widget>[],
    //); //Container(Text(binData));
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: binData.length,
            itemBuilder: (BuildContext ctxt, int index) {
              //return new Text(condensed.elementAt(index));
              return ListTile(
                title: Text(binData.elementAt(index).binTitle),
                subtitle: Text(binData.elementAt(index).binDate),
              );
            },
          ),
        ),
      ],
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
