
import 'package:flutter/material.dart';
import 'package:tober/home_screen.dart';

class InstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Инструкция"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Вам предлагается несколько тем. Выберете, пожалуйста, одно или два подходящих для Вас утверждения из каждой темы. В случае если нет подходящих утверждений в определенной теме, Вы можете выбрать вариант – «Ни одно утверждение мне не подходит». Время для ответов не ограничено.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: RaisedButton(
                  child: Text("Перейти к тесту"),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen(title: 'Методика ТОБер')),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
