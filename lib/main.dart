import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        '/discover-menu': (BuildContext context) => DiscoverMenu(),
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
    );
  }
}

class FullText extends StatelessWidget {
  final pageView = PageView(
    controller: PageController(
        initialPage:
            1), // TODO: Replace 1 by the first page ; set children to be all the other pages using a function ; decide side scrolling vs vertical scrolling
  );

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
                height: size.height / 1.20,
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

class DiscoverMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Discover"),
      drawer: drawerMenu(context),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.count(
          crossAxisCount: 2,
          primary: false,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 3,
          children: <Widget>[
            discoverButton("Text 1"),
            discoverButton("Text 2"),
            discoverButton("Text 3"),
            discoverButton("Text 4"),
          ],
        ),
      ),
    );
  }
}

Widget discoverButton(String text) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Center(
      child: Container(
        width: 200,
        child: RaisedButton(
          onPressed: () => null,
          color: Colors.red[400],
          child: Text(
            text,
            style: GoogleFonts.lato(fontSize: 20),
          ),
        ),
      ),
    ),
  );
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
              """
            
The Communist 
Manifesto""",
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
        ),
        redirectButton(context, '/fullText', 'Full text', Icon(Icons.book)),
        redirectButton(context, '/discover-menu', 'Discover', Icon(Icons.apps))
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

Widget coolPunchline(){
  return Text(ultraCoolPunchline, textAlign: TextAlign.center,style: TextStyle(fontSize: 30));
}