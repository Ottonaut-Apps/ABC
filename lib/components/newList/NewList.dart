import 'package:flutter/material.dart';
import 'package:pawerful/components/Database.dart';
import 'package:uuid/uuid.dart';

import 'package:pawerful/main.dart';

import '../listenAnzeige.dart';

/// Hauptfarbe Grün wird global definiert
final Color backgroundColor = Color(0xFF4CAF50);

/// NewList ist ein StatefulWidget -> Klasse hat verschiedene States
/// - Standardkonstruktor
/// - State wird mittels _NewListState aufgerufen
class NewList extends StatefulWidget {
  const NewList({super.key});

  @override
  State<NewList> createState() => _NewListState();
}

/// Für die Radiobuttons
/// Auswahl zwischen privaten (nur für den Nutzer sichbar)
/// und öffentlichen (für mehrere Nutzer sichtbar) Listen
/// Warning:
///   - Öffentliche Listen sind nicht implementiert
///   - Es werden in jedem Fall private Listen erstellt
enum SingingCharacter { privat, public }

class _NewListState extends State<NewList> {
  /// @param _title - speichern der Eingabe des Titelfeldes
  /// @param _character wird inital auf privat gesetzt
  final _title = TextEditingController();
  SingingCharacter? _character = SingingCharacter.privat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Neue Liste erstellen"),
          backgroundColor: backgroundColor,
            /// Zurück-Knopf führt zurück zur LandingPage
            /// Vermeidet Fehler -> keine letzte Liste
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          )
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child:
          Column(
            children: [
              Form(
                child: Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      TextFormField(
                        /// Speichern des Titels
                        controller: _title,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.abc),
                          labelText: 'Titel deiner neuen Liste',
                        ),
                      ),
                      /// Abstand zu weiteren Feldern
                      Padding(
                          padding: EdgeInsets.all(20)
                      ),
                      /// Infotext
                      Container(
                          color: Colors.black12,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                "Die Liste kann privat nur für dich sichtbar sein, oder öffentlich. Dann können Andere mittels Raumcode an der Liste arbeiten."
                            ),
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.all(10)
                      ),
                      /// Radio Buttons mittels ListTiles
                      /// Radio Buttons erlauben nur einen ausgewählten Wert
                      /// -> gewolltes verhalten
                      /// - _character setzt Wert aus dem enum -> privat/public
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
              /// Knopf zum Absenden der Request an die Datenbank
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  /// passiert Asynchron, da DB erst gelesen werden muss
                  onPressed: () async {
                  // Prüfen auf Valide Eingabe -> , oder \n würde die CSV-Datei kaputt machen
                  if(_title.text.contains(',')) {
                    const snackBar = SnackBar(
                      content: Text('Der Titel darf kein Komma , enthalten!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  /// Ein Titel muss eingeben werden
                  } else if (_title.text.isEmpty == false) {
                      /// Initialiseren der DB
                      /// -> damit db Aufrufe gemacht werden können
                      ABCStorage db = ABCStorage();

                      /// Einzigartige ID erstellen mittels UUID
                      /// -> allerdings immer noch möglich, dass diese 2x vorkommt
                      /// -> keine Prüfung der UUID
                      var uuid = Uuid();
                      /// uuid.v4() erstellt UUID als String
                      String id = uuid.v4();

                      /// Zeile in CSV-Datei schreiben mit neuem Titel und ID
                      /// Im Prototyp ist die ABC-Liste in jedem Fall privat
                      await db.createLine(id,_title.text, true);

                      Line line = await db.getLine(id);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => abcDashboard(line.id, line.title, line.private)),
                      );
                      /// Ohne Titel Fehlermeldung an den Nutzer mittels Snackbar
                    } else {
                      const snackBar = SnackBar(
                        content: Text('Bitte gib einen Titel ein!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }, child: Text("Liste erstellen"),
                ),
              ),
            ],
          ),
        )
    );
  }
}
