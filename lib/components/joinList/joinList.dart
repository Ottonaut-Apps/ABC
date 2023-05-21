import 'package:flutter/material.dart';
import 'package:pawerful/main.dart';

final Color backgroundColor = Color(0xFF4CAF50);

/// Fenster hat noch keinen wahren Nutzen -> Vorbereitung auf eine Liste, an der
/// meherere mitarbeiten können
class JoinList extends StatefulWidget {
  const JoinList({super.key});

  @override
  State<JoinList> createState() => _JoinListState();
}

/// _titel: Raumcode
class _JoinListState extends State<JoinList> {
  final _title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Raum beitreten"),
        backgroundColor: backgroundColor,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              child: Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// TextFeld in dem der Raumcode eingeben werden kann
                    TextFormField(
                      controller: _title,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.code),
                        labelText: 'Raumcode',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /// Auf Knopfdruck würde zur öffentlichen Liste geführt werden
            /// im Prototyp führt der Knopf nur zur LandingPage
            /// -> jedoch nur wenn ein Raumcode eingeben wurde
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  if (_title.text.isEmpty == false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  } else {
                    const snackBar = SnackBar(
                      content: Text("Bitte gib einen Raumcode ein."),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text("Raum beitreten"),
              ),
            )
          ],
        )
      ),
    );
  }
}