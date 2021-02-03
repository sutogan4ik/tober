import 'package:flutter/material.dart';

import '../data/data.dart';

class ListItem extends StatelessWidget {
  Answer answer;
  Function(bool) stateListener;

  ListItem(this.answer, this.stateListener);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 0,
      child: Row(
        children: [
          Checkbox(
            value: answer.state,
            onChanged: stateListener,
          ),
          Flexible(
            child: Text("${answer.position}. ${answer.title}"),
          )
        ],
      ),
    );
  }
}
