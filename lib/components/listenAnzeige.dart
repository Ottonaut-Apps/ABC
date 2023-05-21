import 'package:flutter/material.dart';

import 'package:pawerful/components/privateList/TitleBar.dart';
import 'package:pawerful/components/drawer/Menu.dart';
import 'package:pawerful/components/privateList/List.dart';

final Color backgroundColor = Color(0xFF4CAF50);

class abcDashboard extends StatelessWidget {
  String title = "";
  String id = "";
  bool private = true;

  abcDashboard(String id, String title, bool private) {
    this.title = title;
    this.id = id;
    this.private = private;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
        ],
      ),
    );
  }
  Widget menu(context) {
    return Scaffold(
      appBar: TitleBar(id, Text(title)),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ABCListe(id, title)
        ),
      drawer: Menu(),
    );
  }
}

