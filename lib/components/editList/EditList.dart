import 'package:flutter/material.dart';
import 'package:pawerful/components/newList/LandingPage.dart';

import '../Database.dart';
import '../listenAnzeige.dart';

const Color backgroundColor = Color(0xFF4CAF50);

/// Essentiel das gleiche wie NewList -> siehe NewList für mehr Dokumentation
/// Ruft andere DB-Operation auf
/// Hat die Möglichkeit eine Liste zu Löschen
class EditList extends StatefulWidget {
  String id = "";
  String title = "";

  EditList(this.id, this.title, {super.key});

  @override
  State<EditList> createState() => _EditListState(id, title);
}
enum SingingCharacter { privat, public }

class _EditListState extends State<EditList> {
  late String id;
  late String title;

  _EditListState(this.id, this.title);

  final _title = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SingingCharacter? _character = SingingCharacter.privat;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: const Text("Liste bearbeiten"),
            backgroundColor: backgroundColor,
            leading: BackButton(
              color: Colors.white,
              onPressed: () async {
                ABCStorage db = ABCStorage();
                Line line = await db.getLine(id);

                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => abcDashboard(line.id, line.title, line.private)),
                );
              },
            )
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child:
          Column(
            children: [
              Form(
                key: _formKey,
                child: Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      TextFormField(
                        controller: _title,
                        // The validator receives the text that the user has entered.
                        decoration: const InputDecoration(
                          icon: Icon(Icons.abc),
                          labelText: 'Listentitel',
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),

                      const Padding(
                          padding: EdgeInsets.all(20)
                      ),
                      Container(
                          color: Colors.black12,
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                "Die Liste kann privat nur für dich sichtbar sein, oder öffentlich. Dann können Andere mittels Raumcode an der Liste arbeiten."
                            ),
                          )
                      ),
                      const Padding(
                          padding: EdgeInsets.all(10)
                      ),
                      ListTile(
                        title: const Text('privat'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.privat,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('öffentlich'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.public,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /// Liste Löschen Button ruft DeleteLine in der DB auf
              /// Führt danach zur LandingPage
              /// Ohne Sicherheitsfrage ob man sich sicher ist -> Möglichkeit weiter auszubauen
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        ABCStorage db = ABCStorage();
                        await db.deleteLine(id);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LandingPage()),
                        );
                      }, child: const Text("Liste Löschen"),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Expanded(
                    child:  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () async {
                        // Prüfen auf Valide Eingabe -> , oder \n würde die CSV-Datei kaputt machen
                        if(_title.text.contains(',')) {
                          const snackBar = SnackBar(
                            content: Text('Der Titel darf kein Komma , enthalten!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        /// Neuer Titel wird nur abgespeichert wenn einer eingegeben wird -> Probleme treten bei Titeln mit Kommas auf
                         } else if (_title.text.isEmpty == false) {

                          ABCStorage db = ABCStorage();
                          await db.updateLine(id, title: _title.value.text);

                          Line line = await db.getLine(id);

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => abcDashboard(line.id, line.title, line.private)),
                          );
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Bitte gib einen Titel ein!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }, child: const Text("Änderungen speichern"),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
