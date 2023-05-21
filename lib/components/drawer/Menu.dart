import 'package:flutter/material.dart';
import 'package:pawerful/components/Database.dart';
import 'package:pawerful/components/drawer/entry.dart';
import 'package:pawerful/components/joinList/joinList.dart';

import '../newList/NewList.dart';

/// Menu: Anzeige des Drawers
/// - Drawer Header
/// - Liste aller erstellten Listen
/// - Auswahl zwischen Raum beitreten und neue Liste erstellen
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

/// Arbeitet mit States und FutureBuilder -> Auslesen aus DB
class _MenuState extends State<Menu> {
  /// Sicherstellen, dass die Entries mind. einmal ausgelesen werden
  ///
  /// Auf Linus kein Problem, auf Handy befindet sich das Future sonst noch im
  /// "waiting" state
  Future<List<String>>? _entriesFuture;
  @override
  initState() {
    _entriesFuture = getEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: ListView(
                controller: ScrollController(),
                shrinkWrap: true,
                children: [
                  // DrawerHeader zeigt Titel an
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Text('Meine ABC-Listen', style: TextStyle(fontSize: 28, color: Colors.white),),
                  ),
                  /// FutureBuilder für Entries, die aus der DB ausgelesen werden
                  /// - future: Liste aus CSV-Datei, werden in snapshot gespeichert
                  FutureBuilder<List<String>>(
                      future: _entriesFuture,
                      builder: (context, snapshot) {
                        /// Error-Abfrage
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        /// Wenn CSV-Datei leer == null
                        /// oder alle Listen gelöscht CSV-Datei == ""
                        if (!snapshot.hasData || snapshot.data![0] == "") {
                          // benötigt Rückgabewert -> SizedBox zeigt nichts an
                          return const SizedBox();
                        } else {
                          List<String> entities;
                          entities = snapshot.data!;
                          /// Scrolling funktioniert nur auf "Linux(desktop)" mit
                          /// Maus, jedoch nicht auf dem Handy, Fehler erst spät aufgefallen
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                /// Entities wird mittels split in ein weites Array mit
                                /// den Werten mit jeder Iteration aufgeteilt
                                /// -> erstellen eines Entry benötigt id, name, private
                                /// -> mittels split sind Werte leicht zu finden
                                var entitiyList = entities[index].split(',');
                                List thisEntity = [];
                                for (int i = 0; i < entitiyList.length; i++) {
                                  thisEntity.add(entitiyList[i]);
                                }

                                return Entry(thisEntity[0], thisEntity[1], true);
                              }
                          );
                        }
                      }
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child:
                /// Untere Buttons welche zu den Widgets
                /// - JoinList -> Raumcode
                /// - NewList -> Neue Liste erstellen
                /// führen
                Container(
                    alignment: Alignment.bottomCenter,
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Column(
                          children: <Widget>[
                            const Divider(),
                            ListTile(
                              title: const Text('Raum beitreten'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const JoinList()),
                                );
                              },
                            ),
                            ListTile(
                              title: const Text('Liste erstellen +'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const NewList()),
                                );
                              },
                            )
                          ],
                        )
                    )
                ),
              )
            ],
        )
    );
  }
  
  /// Holt eine Liste von Strings aus der CSV-Datei
  /// formt Liste mittels split-methode
  Future<List<String>> getEntries() async {
    ABCStorage db = ABCStorage();
    String content;

    content = await db.readFile();
    List<String> strings = [];
    strings = content.split("\n");

    return strings;
  }
}



