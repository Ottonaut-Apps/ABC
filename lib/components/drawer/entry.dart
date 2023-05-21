import 'package:flutter/material.dart';

import '../listenAnzeige.dart';
/// Für den Drawer sollen die Listen dynamisch eingetragen werden
/// Die Listen bestehen aus Entries, welche die Daten für die Liste aus
/// der CSV-Datei enthalten -> id, name, privat
class Entry extends StatefulWidget {
  /// Member müssen initalisiert sein, werden jedoch immer überschrieben
  String name = "null";
  String id = "";
  bool private = true;

  /// Konstruktor mit Daten aus CSV-Datei
  Entry(String title, this.id, this.private, {super.key}) {
    name = title;
  }

  @override
  State<Entry> createState() => _EntryState(id, name, private);
}

class _EntryState extends State<Entry> {
  late String name;
  late String id;
  bool private = true;

  _EntryState(String title, this.id, this.private) {
    name = title;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      onTap: () {
        Navigator.push(
          context,
          //erstellt immer neue Liste
          // Routing leider noch nicht richtig
          // besser wäre nicht jedes Mal eine neue Liste zu erstellen und dabei
          // alle Daten auszulesen, sondern für jede Liste eine Route anzulegen,
          // welche aufgerufen wird.
          // -> nicht performant
          MaterialPageRoute(builder: (context) => abcDashboard(id, name, private)),
        );
      },
    );
  }
}