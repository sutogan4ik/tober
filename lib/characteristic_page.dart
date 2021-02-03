
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tober/data/user.dart';
import 'package:tober/widgets.dart';

class CharacteristicsPage extends StatefulWidget {


  @override
  _CharacteristicsPageState createState() => _CharacteristicsPageState();
}

class _CharacteristicsPageState extends State<CharacteristicsPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.all(16.0)),
        Text("Характеристика цикла",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start),
        formElement(cycleCharacteristics.startDays, "Через сколько дней начало менструации", (value){
          cycleCharacteristics.startDays = value;
        }),
        formElement(cycleCharacteristics.duration, "Длительность", (value){
          cycleCharacteristics.duration = value;
        }),
        formElement(cycleCharacteristics.abundance, "Обильность", (value){
          cycleCharacteristics.abundance = value;
        }),
        formElement(cycleCharacteristics.soreness, "Болезненость", (value){
          cycleCharacteristics.soreness = value;
        }),
        formElement(userInfo.cycleChange, "Смена цикла, связанная с чем – либо (аборты, роды, заболевания)", (value){
          userInfo.cycleChange = value;
        }),
        formElement(null, "Дата последней менструации", null, (){
          getDate();
        }, null, fieldController),
      ],
    );
  }

  final TextEditingController fieldController = TextEditingController();
  @override
  void initState() {
    fieldController.text = userInfo.lastMenstruationDate;
    super.initState();
  }

  Future getDate() async {
    var date = await getDatePicker(context);
    String formattedDate = DateFormat('dd MMMM yyyy', "ru").format(date);
    this.setState(() {
      userInfo.lastMenstruationDate = formattedDate;
      fieldController.text = userInfo.lastMenstruationDate;
    });
  }
}
