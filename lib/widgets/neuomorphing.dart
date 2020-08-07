import 'package:flutter/material.dart';

class Neuomorphing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Neuomorphing",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff4B79A1),
      ),
      body: Container(
        width: s.width,
        height: s.height,
        color: Color(0xff4B79A1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: s.width / 2,
              height: s.width / 2,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: s.width / 2 - 12,
                      height: s.width / 2 - 12,
                      child: Center(
                        child: Text(
                          "Rectangled",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff4B79A1),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            offset: Offset(-6, -6),
                            blurRadius: 4,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(6, 6),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: s.width / 2,
              height: s.width / 2,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: s.width / 2 - 12,
                      height: s.width / 2 - 12,
                      child: Center(
                        child: Text(
                          "Rounded",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff4B79A1),
                        borderRadius: BorderRadius.circular(s.width / 2 - 12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            offset: Offset(-6, -6),
                            blurRadius: 4,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(6, 6),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
