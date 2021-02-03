
import 'package:flutter/material.dart';
import 'package:tober/data/user.dart';
import 'package:tober/widgets.dart';

class SexualFunctionPage extends StatefulWidget {
  @override
  _SexualFunctionPageState createState() => _SexualFunctionPageState();
}

class _SexualFunctionPageState extends State<SexualFunctionPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.all(16.0)),
        Text("Половая функция",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start),
        formElement(sexualFunction.sexualActivity, "Начало половой жизни (возраст)", (value){
          sexualFunction.sexualActivity = value;
        }),
        formElement(sexualFunction.contraceptives, "Контрацептивные средства", (value){
          sexualFunction.contraceptives = value;
        }),
        formElement(sexualFunction.pastGynecologicalDiseases, "Перенесенные в прошлом гинекологические заболевания", (value){
          sexualFunction.pastGynecologicalDiseases = value;
        }),
      ],
    );
  }
}
