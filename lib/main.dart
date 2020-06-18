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

class DiscoverMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar("Discover"),
      drawer: drawerMenu(context),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              discoverContainer(size, Colors.red[100]),
              discoverContainer(size, Colors.red[200])
            ],
          ),
          Row(
            children: <Widget>[
              discoverContainer(size, Colors.red[300]),
              discoverContainer(size, Colors.red[400])
            ],
          )
        ],
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

Widget coolPunchline() {
  return Text(ultraCoolPunchline,
      textAlign: TextAlign.center, style: TextStyle(fontSize: 30));
}

Widget discoverContainer(size, color) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      
      border: Border.all(color: Colors.black),
    ),
    width: size.width / 2,
    height: 200,
  );
}
