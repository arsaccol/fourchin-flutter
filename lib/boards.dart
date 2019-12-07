import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BoardsScreen extends StatelessWidget {
  final boardsUrl = 'https://a.4cdn.org/boards.json';
  dynamic boardsData = null;
  
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get(boardsUrl),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          this.boardsData = jsonDecode(snapshot.data.body)['boards'];
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            itemCount: boardsData.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text(
                    this.boardsData[i]['title'].toString(),
                  ),
                ),
              );
            },

          );
        } //if snapshot etc.
        
        else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              Text(
                'Getting boards...',
              ),
              Divider(
                height: 30,
              ),
              CircularProgressIndicator()
            ]
          );

        }

      }

    );





  }

}