import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  static const String text='If all you do is follow the exact same routine every day, you will never leave yourself open to moments of sudden discovery. Do you remember how spontaneous you were as a child? Anything could happen, at any moment!';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Guide For COD',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 10,

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 0.0,
                    fontFamily: 'SourceCodePro-Black',
                    //fontWeight: FontWeight.bold,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 1,
                    //fontWeight: FontWeight.bold,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 1,
                    //fontWeight: FontWeight.bold,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 1,
                    //fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
