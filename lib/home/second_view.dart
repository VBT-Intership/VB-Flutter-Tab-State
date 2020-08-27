import 'package:flutter/material.dart';

class SecondView extends StatefulWidget {
  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("A");
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Hero(tag: "A", child: Placeholder()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        heroTag: 2,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
