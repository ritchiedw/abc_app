import 'package:flutter/material.dart';

import 'bin_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BinTile(),
      ],
    );
  }
}
