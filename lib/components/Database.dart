import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';

class ABCStorage{

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    if(await File('$path/ABCListen.txt').exists() == false){
      return await new File('$path/ABCListen.txt').create(recursive: false);
    }

    return File('$path/ABCListen.txt');
  }

  Future<String> readFile() async {
    String content;
    try {
      final file = await _localFile;

      content = await file.readAsString();
      return content;
    } catch (e) {
      print(e.toString());
      return "Error";
    }
  }

  Future<void> writeFile(String text) async {
    final file = await _localFile;

    // Write the file
    file.writeAsString("$text");
  }

  Future<void> writeFile2() async {
    final file = await _localFile;

    // Write the file
    file.delete();
  }

  Future<void> createLine(String id, String title, bool private) async {
    Line line = Line(id, title, private);

    String db = (await readFile()).toString();

    String newline = line.toString();

    if(db == ""){
      db += newline;
    } else{
      db += "\n" + newline;
    }
    await writeFile(db);
  }

  Future<void> createLineFromLine(Line line) async {
    String db = (await readFile()).toString();

    String newline = line.toString();

    if(db == "") {
      db += newline;
    }else{
      db += "\n" + newline;
    }


    await writeFile(db);
  }

  Future<Line> getLine(String id) async {
    String db = await readFile();
    List lines = db.split('\n');
    String string = "";

    for(int i = 0; i < lines.length; i++) {
      if(lines[i].toString().contains(id)){
        string = lines[i].toString();
        break;
      }
    }
    List elements = string.split(',');

    Line line = Line(elements[0], elements[1], elements[2] == "true");
    line = line.toLine(string);
    return line;
  }

  Future<void> updateLine(String id, {
    String? title, bool? private,
    String? a, String? b, String? c, String? d,
    String? e, String? f, String? g, String? h,
    String? i, String? j, String? k, String? l,
    String? m, String? n, String? o, String? p,
    String? q, String? r, String? s, String? t,
    String? u, String? v, String? w, String? x,
    String? y, String, z
  }) async {
    Line line = await getLine(id);

    if(title != null) {
      line.setTitle(title);
    }
    if(a != null) {
      line.setA(a);
    }
    if(b != null) {
      line.setB(b);
    }
    if(c != null) {
      line.setC(c);
    }
    if(d != null) {
      line.setD(d);
    }
    if(e != null) {
      line.setE(e);
    }
    if(f != null) {
      line.setF(f);
    }
    if(g != null) {
      line.setG(g);
    }
    if(h != null) {
      line.setH(h);
    }
    if(i != null) {
      line.setI(i);
    }
    if(j != null) {
      line.setJ(j);
    }
    if(k != null) {
      line.setK(k);
    }
    if(l != null) {
      line.setL(l);
    }
    if(m != null) {
      line.setM(m);
    }
    if(n != null) {
      line.setN(n);
    }
    if(o != null) {
      line.setO(o);
    }
    if(p != null) {
      line.setP(p);
    }
    if(q != null) {
      line.setQ(q);
    }
    if(r != null) {
      line.setR(r);
    }
    if(s != null) {
      line.setS(s);
    }
    if(t != null) {
      line.setT(t);
    }
    if(u != null) {
      line.setU(u);
    }
    if(v != null) {
      line.setV(v);
    }
    if(w != null) {
      line.setW(w);
    }
    if(x != null) {
      line.setX(x);
    }
    if(y != null) {
      line.setY(y);
    }
    if(z != null) {
      line.setZ(z);
    }
    /*
    Ziel: Titel, privat oder Buchstaben zu updaten
    Titel & privat aus dem "Liste bearbeiten" Menü
    Benötigt: Line, neue Werte
     */
    await deleteLine(line.id);
    await createLineFromLine(line);
  }

  Future<void> deleteLine(String id) async {
    String db = await readFile();
    List lines = db.split('\n');
    String newDb = "";

    if(lines[0].toString().contains(id) == false){
      newDb += lines[0].toString();
    }
    for(int i = 1; i < lines.length; i++) {
      if(lines[i].toString().contains(id)){
      }else{
        if(newDb == "") {
          newDb += lines[i].toString();
        }else{
          newDb += "\n" + lines[i].toString();
        }
      }
    }

    await writeFile(newDb);
  }

  /*
  function writeFile(String string): void

  function readFile(): Line[]

     file.readAsString -> String -> Line[]
     
     String -> String + \n + String + ...
     Vereinzelte Strings -> Line konverter
     "uuid,private,..." ---> s.split(',') --> Array<String>  res --> UUID id = res[0], private = res[1] ...
     Converted Strings -> Array --> return

     type Line {
     UUid id;
     boolean privqte;
     String a;
     ...
     }


  void createLine(Vars) async {
  var db = readFile()
  const line = Vars umgewandelt in valide Line
  db = db + "\n" + line
  writeFile(db)
 }

  function getLine(UUID id): Line[]

  function updateLine(Line[]): void

  function deleteLine(UUID id): void
   */
}

class Line {
  String id = "";
  String title = 'Beispiel';
  bool private = true;

  String? a;
  String? b;
  String? c;
  String? d;
  String? e;
  String? f;
  String? g;
  String? h;
  String? i;
  String? j;
  String? k;
  String? l;
  String? m;
  String? n;
  String? o;
  String? p;
  String? q;
  String? r;
  String? s;
  String? t;
  String? u;
  String? v;
  String? w;
  String? x;
  String? y;
  String? z;

  Line(String id, String title, bool private) {
    this.id = id;
    this.title = title;
    this.private = private;
  }

  /*
  function getUniqueId() {
    Hole DB -> Hole einzelne IDs
    Uuid uuid = new Uuid()

    String newId = erste bereits existierende Id
    while(newId == existierende Ids) {
      newId = uuid.v4()
    }

    return newId
  }

  String id = getUniqueId();

  var line = Line(id, ...)
   */

  Line.withABC(String id, String title, bool private,
      { String a = "", String b = "", String c = "", String d = "",
        String e = "", String f = "", String g = "", String h = "",
        String i = "", String j = "", String k = "", String l = "",
        String m = "", String n = "", String o = "", String p = "",
        String q = "", String r = "", String s = "", String t = "",
        String u = "", String v = "", String w = "", String x = "",
        String y = "", String z = ""
      }) {
    this.id = id;
    this.title = title;
    this.private = private;
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
    this.e = e;
    this.f = f;
    this.g = g;
    this.h = h;
    this.i = i;
    this.j = j;
    this.k = k;
    this.l = l;
    this.m = m;
    this.n = n;
    this.o = o;
    this.p = p;
    this.q = q;
    this.r = r;
    this.s = s;
    this.t = t;
    this.u = u;
    this.v = v;
    this.w = w;
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void setTitle(String title) {
    this.title = title;
  }

  void setA(String a) {
    this.a = a;
  }

  void setB(String b) {
    this.b = b;
  }

  void setC(String c) {
    this.c = c;
  }

  void setD(String d) {
    this.d = d;
  }

  void setE(String e) {
    this.e = e;
  }

  void setF(String f) {
    this.f = f;
  }

  void setG(String g) {
    this.g = g;
  }

  void setH(String h) {
    this.h = h;
  }

  void setI(String i) {
    this.i = i;
  }

  void setJ(String j) {
    this.j = j;
  }

  void setK(String k) {
    this.k = k;
  }

  void setL(String l) {
    this.l = l;
  }

  void setM(String m) {
    this.m = m;
  }

  void setN(String n) {
    this.n = n;
  }

  void setO(String o) {
    this.o = o;
  }

  void setP(String p) {
    this.p = p;
  }

  void setQ(String q) {
    this.q = q;
  }

  void setR(String r) {
    this.r = r;
  }

  void setS(String s) {
    this.s = s;
  }

  void setT(String t) {
    this.t = t;
  }

  void setU(String u) {
    this.u = u;
  }

  void setV(String V) {
    this.v = v;
  }

  void setW(String w) {
    this.w = w;
  }

  void setX(String x) {
    this.x = x;
  }

  void setY(String y) {
    this.y = y;
  }

  void setZ(String z) {
    this.z = z;
  }

  Line toLine(String string) {
    List<String> elements = string.split(',');

    return Line.withABC(
        elements[0], elements[1], elements[2].toLowerCase() == 'true',
        a: elements[3], b: elements[4], c: elements[5], d: elements[6],
        e: elements[7], f: elements[8], g: elements[9], h: elements[10],
        i: elements[11], j: elements[12], k: elements[13], l: elements[14],
        m: elements[15], n: elements[16], o: elements[17], p: elements[18],
        q: elements[19], r: elements[20], s: elements[21], t: elements[22],
        u: elements[23], v: elements[24], w: elements[25], x: elements[26],
        y: elements[27], z: elements[28]
    );
  }

  @override
  String toString() {
    return '$id,$title,$private,$a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$l,$m,$n,$o,$p,$q,$r,$s,$t,$u,$v,$w,$x,$y,$z';
  }
}