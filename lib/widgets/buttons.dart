import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButtonRectangleBorder(),
            SizedBox(height: 16),
            FlatButtonRectangleBorder(),
            SizedBox(height: 16),
            RaisedButtonRectangleGradientBorder(),
            SizedBox(height: 16),
            FlatButtonRectangleGradientBorder(),
            SizedBox(height: 16),
            CircularButton(),
          ],
        ),
      ),
    );
  }
}

class RaisedButtonRectangleBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      splashColor: Colors.orange,
      focusColor: Colors.white,
      onPressed: () {},
      color: Colors.red,
      child: Text(
        "Raised Button",
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(color: Colors.black, width: 2),
      ),
    );
  }
}

class FlatButtonRectangleBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      splashColor: Colors.red,
      focusColor: Colors.white,
      highlightColor: Colors.white.withOpacity(0.2),
      onPressed: () {},
      color: Colors.orange,
      child: Text(
        "Flat Button",
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(color: Colors.black, width: 2),
      ),
    );
  }
}

class RaisedButtonRectangleGradientBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF16BFFD),
                Color(0xFFCB3066),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(80.0))),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: const Text('Gradient Raised Button'),
      ),
    );
  }
}

class FlatButtonRectangleGradientBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFFdb36a4),
                Color(0xFFf7ff00),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(80.0))),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: const Text('Gradient Flat Button'),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  const CircularButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 4.0,
      focusElevation: 0.0,
      highlightElevation: 0.0,
      hoverElevation: 0.0,
      fillColor: Colors.teal,
      child: Icon(
        Icons.ac_unit,
        size: 24.0,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(18.0),
      shape: CircleBorder(),
    );
  }
}
