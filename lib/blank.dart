import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/data.dart';

class ResultBlank extends StatelessWidget {
  List<PageData> dataSet;
  Function() prev;
  Function() resultListener;

  ResultBlank(this.dataSet, this.prev, this.resultListener);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                  "Регистрационный бланк к методике",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Header(),
            for(var i in dataSet) Item(i),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  child: Text("Назад"),
                  onPressed: prev,
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text("Результат"),
                  onPressed: resultListener,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
                "Темы",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center
            ),
          ),
          Expanded(
            child: Text(
                "Подходящие выборы",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center
            ),
          )
        ],
      ),
    );
  }
}

class Item extends StatelessWidget{
  PageData data;
  Item(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
                data.title,
            ),
          ),
          Expanded(
            child: Text(
                "${data.results.map((e) => e.position)}",
                textAlign: TextAlign.center
            ),
          )
        ],
      ),
    );
  }

}
