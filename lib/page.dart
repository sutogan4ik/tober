import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'view/item.dart';
import 'data/data.dart';

class _ImplPageList extends State<PageList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.data.answers.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.all(15),
              child: Text(
                widget.data.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          } else if (index == widget.data.answers.length + 1) {
            return Container(
              width: 100,
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text("Назад"),
                    onPressed: widget.prev,
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text("Следующая группа"),
                    onPressed: widget.data.results.isEmpty ? null : widget.next,
                  )
                ],
              ),
            );
          } else {
            var item = widget.data.answers[index - 1];
            var results = widget.data.results;
            return ListItem(item, (bool newState) {
              setState(() {
                if(newState){ //если чекбокс активен
                  if(item.position == 17){// если выбрали последний пункт тогда очищаем все отмеченые и добавляем в результат
                    results.forEach((element) {
                      element.state = false;
                    });
                    results.clear();
                    results.add(item);
                  }else{
                    var index = results.indexWhere((element) => element.position == 17);
                    if(index > -1){
                      results[index].state = false;
                      results.removeAt(index);
                    }
                    if(results.length < 2){
                      results.add(item);
                    }else{
                      var prevChecked = results[0];
                      prevChecked.state = false;
                      results.removeAt(0);
                      results.add(item);
                    }
                  }
                }else{
                  results.removeWhere((element) => element.position == item.position);
                }
                item.state = newState;
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

  PageList(this.data, this.next, this.prev): super(key: Key(data.title));

  @override
  _ImplPageList createState() => _ImplPageList();



}


