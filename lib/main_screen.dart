import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
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
            FlatButton(
              child: Text("Report It"),
              onPressed: () {},
            ),
            FlatButton(
              child: Text("Request It"),
              onPressed: () {},
            ),
            FlatButton(
              child: Text("Pay It"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
