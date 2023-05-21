import 'package:flutter/material.dart';

import '../editList/EditList.dart';

/// Titelbar verheinheitlicht die AppBar
class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = const Color(0xFF4CAF50);
  Text title = const Text("ABC");
  late String id;
  /// Titel der jeweiligen Liste oder des Fensters wird angezeigt.
  /// Ist im Zweifelfall keine angezeigt, wird "ABC" angezeigt
  final AppBar appBar = AppBar();

  TitleBar(this.id, this.title, {super.key});


  @override
  Widget build(BuildContext context) {
    /// Für die Landingpage, welche keine Id hat wird das Editierrädchen nicht
    /// angezeigt um unerwartetes Verhalten auszuschließen
    if(id != ""){
      final List<Widget> widgets = <Widget>
      /// Button führt zur EditList Seite
      [IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditList(id, title.toString())),
            );
          },
        ),
        const Text("    "),
      ];
      return AppBar(
        title: title,
        backgroundColor: backgroundColor,
        actions: widgets,
      );
    }
    else{
      return AppBar(
        title: title,
        backgroundColor: backgroundColor,
      );
    }

  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
