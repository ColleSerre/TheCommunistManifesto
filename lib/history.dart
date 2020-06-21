import 'package:Oauth/commons.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("History"),
      drawer: drawerMenu(context),
    );
  }
}
