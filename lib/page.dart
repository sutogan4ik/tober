import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './item.dart';
import './data.dart';

class _ImplPageList extends State<PageList> {
  PageData data;
  Function() next;
  Function() prev;

  _ImplPageList(this.data, this.next, this.prev);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.answers.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.all(15),
              child: Text(
                data.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          } else if (index == data.answers.length + 1) {
            return Container(
              width: 100,
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text("Назад"),
                    onPressed: prev,
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text("Следующая группа"),
                    onPressed: next,
                  )
                ],
              ),
            );
          } else {
            return ListItem(data.answers[index - 1], (bool newState) {
              setState(() {
                data.answers[index - 1].state = newState;
              });
            });
          }
        });
  }
}

class PageList extends StatefulWidget{
  PageData data;
  Function() next;
  Function() prev;

  PageList(this.data, this.next, this.prev): super();

  @override
  _ImplPageList createState() => _ImplPageList(data, next, prev);

}


