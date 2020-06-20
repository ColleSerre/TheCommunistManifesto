import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Manifesto.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/fullText': (BuildContext context) => FullText(),
        '/facts': (BuildContext context) => Facts(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("The Communist Manifesto"),
      drawer: drawerMenu(context),
      body: _buildGrid(context),
    );
  }
}

class FullText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar("Full Text"),
      drawer: drawerMenu(context),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: size.height / 1.25,
                width: size.width / 1.30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange[200], width: 4),
                    borderRadius: BorderRadius.circular(25)),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      mainTitle(),
                      paragraph(paragraph1),
                      header(header2),
                      paragraph(paragraph2),
                      header(header3),
                      paragraph(paragraph3),
                      header(header4),
                      paragraph(paragraph4),
                      header(header5),
                      paragraph(paragraph5),
                      coolPunchline()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Facts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Facts"),
      drawer: drawerMenu(context),
      body: Text("Facts"),
    );
  }
}

Widget redirectButton(
    BuildContext context, String path, String text, Icon icon) {
  return Container(
    color: Colors.red[200],
    child: ListTile(
      title: Text(text),
      trailing: icon,
      onTap: () => Navigator.pushNamed(context, path),
    ),
  );
}

Widget appBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title),
    backgroundColor: Colors.red[300],
  );
}

Widget drawerMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 100,
          color: Colors.red[100],
          child: ListTile(
            title: Text(
              "\nThe Communist\nManifesto",
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
        ),
        redirectButton(context, '/fullText', 'Full text', Icon(Icons.book)),
      ],
    ),
  );
}

Widget header(String arg) {
  return Container(
    padding: EdgeInsets.all(9),
    child: Text(
      arg,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );
}

Widget paragraph(String arg) {
  return Container(
    padding: EdgeInsets.all(9),
    child: Text(arg, style: TextStyle(fontSize: 20)),
  );
}

Widget mainTitle() {
  return Text(
    header1,
    textAlign: TextAlign.center,
    style: GoogleFonts.cinzel(fontWeight: FontWeight.bold, fontSize: 30),
  );
}

Widget coolPunchline() {
  return Text(ultraCoolPunchline,
      textAlign: TextAlign.center, style: TextStyle(fontSize: 30));
}

Widget _buildGrid(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return StaggeredGridView.count(
    padding: EdgeInsets.all(8),
    crossAxisCount: 2,
    mainAxisSpacing: 5,
    staggeredTiles: [
      StaggeredTile.count(1, 2),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(2, 1),
    ],
    children: <Widget>[
      GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: 200,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    "Fact of the day", // TODO: Implement Fact of the day feature
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(""),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red[200], width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/fullText"),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: 200,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    "Full Text",
                    style: GoogleFonts.lato(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Read the Communist Manifesto.\nThe small book who changed the whold wide world.",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red[200], width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      Padding( // TODO: Implement History feature
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red[200], width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      Padding( // Implement Communism & Marxism today feature
        padding: const EdgeInsets.only(
          top: 2,
          left: 8,
          right: 8,
          bottom: 8,
        ),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red[200], width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ],
  );
}
