import 'package:flutter/material.dart';

import '../drawer/Menu.dart';
import '../privateList/TitleBar.dart';
import 'NewList.dart';

/// Die Landing Page
/// Definiert die Seite, die der Nutzer als erstes sieht
/// Verhindert den Fall, dass der Nutzer auf eine leere Liste stößt
///
/// - Hintergrundfarbe = grün
class LandingPage extends StatelessWidget {
  final Color backgroundColor = Color(0xFF4CAF50);

  /// Überschreibt Abstrakte Funktion
  /// - Scaffold bietet die Material Design layout structure
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Titlebar wird normalerweise mit ID und Text initalisiert
      /// Keine ID für die LandingPage nötig -> leer lassen
      /// ABC-Listen als Überschrift
      appBar: TitleBar("",Text("ABC-Listen")),
      /// Container beinhaltet Card mit Willkommens/Infotext
      body: Container(
          child: Center(
            child: Card(
              clipBehavior: Clip.none,
              color: backgroundColor,
              /// Card ist clickbar -> führt zur NewList
              /// User hat so eine intuitve Möglichkeit einzusteigen
              /// und seine erste Liste zu erstellen
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewList()),
                  );
                },
                /// In der Card im InkWell befindet sich der Infotext
                /// SizedBox Sorgt für die Größe vom Card
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  /// Zentriert den Text
                  child: Center(
                    child: Text(
                      'Sieh dir deine ABC-Listen an oder erstelle eine Neue!',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
              ),
            ),
          ),
      ),
      drawer: Menu(),
    );
  }
}
