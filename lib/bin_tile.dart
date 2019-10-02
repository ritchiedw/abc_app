import 'package:flutter/material.dart';

class BinTile extends StatelessWidget {
  final String binTitle;
  final String binDate;
  BinTile({this.binTitle, this.binDate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        binTitle,
        style: TextStyle(
          decoration: null,
        ),
      ),
      trailing: Text(binDate),
    );
  }
}
