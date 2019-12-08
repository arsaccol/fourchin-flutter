import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fourchin/single_board.dart';
import 'package:http/http.dart' as http;

import 'package:html_unescape/html_unescape.dart';

import './single_board.dart';

class BoardsScreen extends StatelessWidget {
  final boardsUrl = 'https://a.4cdn.org/boards.json';
  dynamic boardsData = null;
  
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get(boardsUrl),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          var unescape = HtmlUnescape();

          this.boardsData = jsonDecode(snapshot.data.body)['boards'];
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            itemCount: boardsData.length,
            itemBuilder: (context, i) {

              return Card(
                child: InkWell(
                  onTap: () {
                    print('\"${boardsData[i]['title']}\" board card tapped!');
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => SingleBoardScreen(
                          boardTitle: this.boardsData[i]['title'],
                        )
                      )
                    );
                  },
                  child: ListTile(
                    title: Text(
                      this.boardsData[i]['title'].toString(),
                    ),
                    subtitle: Text(
                      unescape.convert(this.boardsData[i]['meta_description']),
                    )
                  ),
                )
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