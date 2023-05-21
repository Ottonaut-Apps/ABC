import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pawerful/components/newList/LandingPage.dart';

/// Hauptaufruf des Programms
/// - jedes Dartprogramm hat die Funktion main
/// - für die App ist hier definiert, dass diese nur im Portraitmodus angezeigt wird
/// - dann wird die App aufgerufen
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

/// MyApp nutzt Flutter um die App zu Starten mit dem Widget build
/// Diese gibt die MaterialApp zurück
/// - ohne Debug Banner
/// - mit Titel der App
/// - mit "Grün" als Hauptfarbe
/// - führt zur LandingPage
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABC-Listen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LandingPage(),
    );
  }
}