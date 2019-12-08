import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleBoardScreen extends StatelessWidget {
  final boardTitle;
  

  SingleBoardScreen({this.boardTitle});


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.boardTitle,
        ),
      ),
      body: Center(
        

      ),
      

    );

  }
}