import 'package:flutter/material.dart';

import '../Database.dart';

class ABCListe extends StatelessWidget {
  late String title;
  late String id;
  ABCListe(this.id, this.title, {super.key});

  @override
  Widget build(BuildContext context) {

    /// Mittels FutureBuilder werden schon vorhandene Werte angezeigt
    return FutureBuilder<Line>(
        /// getThisLine holt die Zeile aus der CSV-Datei, welche die aktuelle Liste enthält
        future: getThisLine(id),
        builder: (context, AsyncSnapshot<Line> snapshot) {
          /// Falls schon Daten vorhanden sind werden diese mittels den xyztexten in die Felder geschrieben
          if (snapshot.hasData) {
            final atext = TextEditingController(text: snapshot.data?.a != "null" ? snapshot.data?.a : "");
            final btext = TextEditingController(text: snapshot.data?.b != "null" ? snapshot.data?.b : "");
            final ctext = TextEditingController(text: snapshot.data?.c != "null" ? snapshot.data?.c : "");
            final dtext = TextEditingController(text: snapshot.data?.d != "null" ? snapshot.data?.d : "");
            final etext = TextEditingController(text: snapshot.data?.e != "null" ? snapshot.data?.e : "");
            final ftext = TextEditingController(text: snapshot.data?.f != "null" ? snapshot.data?.f : "");
            final gtext = TextEditingController(text: snapshot.data?.g != "null" ? snapshot.data?.g : "");
            final htext = TextEditingController(text: snapshot.data?.h != "null" ? snapshot.data?.h : "");
            final itext = TextEditingController(text: snapshot.data?.i != "null" ? snapshot.data?.i : "");
            final jtext = TextEditingController(text: snapshot.data?.j != "null" ? snapshot.data?.j : "");
            final ktext = TextEditingController(text: snapshot.data?.k != "null" ? snapshot.data?.k : "");
            final ltext = TextEditingController(text: snapshot.data?.l != "null" ? snapshot.data?.l : "");
            final mtext = TextEditingController(text: snapshot.data?.m != "null" ? snapshot.data?.m : "");
            final ntext = TextEditingController(text: snapshot.data?.n != "null" ? snapshot.data?.n : "");
            final otext = TextEditingController(text: snapshot.data?.o != "null" ? snapshot.data?.o : "");
            final ptext = TextEditingController(text: snapshot.data?.p != "null" ? snapshot.data?.p : "");
            final qtext = TextEditingController(text: snapshot.data?.q != "null" ? snapshot.data?.q : "");
            final rtext = TextEditingController(text: snapshot.data?.r != "null" ? snapshot.data?.r : "");
            final stext = TextEditingController(text: snapshot.data?.s != "null" ? snapshot.data?.s : "");
            final ttext = TextEditingController(text: snapshot.data?.t != "null" ? snapshot.data?.t : "");
            final utext = TextEditingController(text: snapshot.data?.u != "null" ? snapshot.data?.u : "");
            final vtext = TextEditingController(text: snapshot.data?.v != "null" ? snapshot.data?.v : "");
            final wtext = TextEditingController(text: snapshot.data?.w != "null" ? snapshot.data?.w : "");
            final xtext = TextEditingController(text: snapshot.data?.x != "null" ? snapshot.data?.x : "");
            final ytext = TextEditingController(text: snapshot.data?.y != "null" ? snapshot.data?.y : "");
            final ztext = TextEditingController(text: snapshot.data?.z != "null" ? snapshot.data?.z : "");

            return Material(
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    children: [

                      /// Jedes Feld wird einzeln gelistet -> es gäbe bessere Möglichkeiten
                      /// -> zu spät erkannt

                      /// Jedes Feld besteht
                      /// - labelText: Titel -> Aktueller Buchstabe
                      /// - controller: xyztext -> eingegebener Text des Nutzers
                      /// - suffixIcon: nur per click werden Daten abgespeichert
                      /// - keyboardType: bei mehr Ideen kann über mehrere Zeilen hinweg geschrieben werdne
                      TextField(
                        controller: atext,
                        decoration: InputDecoration(
                          labelText: "A",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              /// updateLine nimmt den Wert der Eingabe und Speichert die Liste neu ab
                              db.updateLine(id, a: atext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: btext,
                        decoration: InputDecoration(
                          labelText: "B",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, b: btext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: ctext,
                        decoration: InputDecoration(
                          labelText: "C",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, c: ctext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),


                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: dtext,
                        decoration: InputDecoration(
                          labelText: "D",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, d: dtext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: etext,
                        decoration: InputDecoration(
                          labelText: "E",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, e: etext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: ftext,
                        decoration: InputDecoration(
                          labelText: "F",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, f: ftext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: gtext,
                        decoration: InputDecoration(
                          labelText: "G",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, g: gtext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: htext,
                        decoration: InputDecoration(
                          labelText: "H",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, h: htext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: itext,
                        decoration: InputDecoration(
                          labelText: "I",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, i: itext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: jtext,
                        decoration: InputDecoration(
                          labelText: "J",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, j: jtext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: ktext,
                        decoration: InputDecoration(
                          labelText: "K",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, k: ktext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: ltext,
                        decoration: InputDecoration(
                          labelText: "L",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, l: ltext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: mtext,
                        decoration: InputDecoration(
                          labelText: "M",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, m: mtext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: ntext,
                        decoration: InputDecoration(
                          labelText: "N",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, n: ntext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: otext,
                        decoration: InputDecoration(
                          labelText: "O",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, o: otext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: ptext,
                        decoration: InputDecoration(
                          labelText: "P",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, p: ptext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),


                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: qtext,
                        decoration: InputDecoration(
                          labelText: "Q",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, q: qtext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: rtext,
                        decoration: InputDecoration(
                          labelText: "R",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, r: rtext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: stext,
                        decoration: InputDecoration(
                          labelText: "S",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, s: stext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: ttext,
                        decoration: InputDecoration(
                          labelText: "T",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, t: ttext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: utext,
                        decoration: InputDecoration(
                          labelText: "U",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, u: utext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: vtext,
                        decoration: InputDecoration(
                          labelText: "V",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, v: vtext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: wtext,
                        decoration: InputDecoration(
                          labelText: "W",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, w: wtext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: xtext,
                        decoration: InputDecoration(
                          labelText: "X",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, x: xtext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: ytext,
                        decoration: InputDecoration(
                          labelText: "Y",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, y: ytext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10)),

                      TextField(
                        controller: ztext,
                        decoration: InputDecoration(
                          labelText: "Z",
                          labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ABCStorage db = ABCStorage();
                              db.updateLine(id, z: ztext.value.text);
                            },
                            icon: const Icon(Icons.save_as),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ],
                  ),
                )
            );
          }
          /// Falls snapshot keine Daten enthält wird Error ausgegben
          else {
            return const Text("Error");
          }
        }
    );
  }

  /// getThisLine holt die Zeile aus der CSV-Datei, welche die aktuelle Liste enthält
  Future<Line> getThisLine(String id) async {
    ABCStorage db = ABCStorage();
    return await db.getLine(id);
  }
}

