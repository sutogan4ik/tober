
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tober/widgets.dart';

import 'data/user.dart';

class RealPregnancyPage extends StatefulWidget {
  @override
  _RealPregnancyPageState createState() => _RealPregnancyPageState();
}

class _RealPregnancyPageState extends State<RealPregnancyPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.all(16.0)),
        Text("Течение настоящей беременности",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start),
        formElement(null, "Дата последней менструации", null, (){
          getDate();
        }, null, fieldController),
        formElement(realPregnancy.gestationalAgeRegistering, "Срок беременности при постановке на учет", (value){
          realPregnancy.gestationalAgeRegistering = value;
        }),
        formElement(null, "Дата первого шевеления плода", null, (){
          getDate2();
        }, null, fieldController2),
        formElement(realPregnancy.complications, "Осложнения во время беременности", (value){
          realPregnancy.complications = value;
        }),
        formElement(realPregnancy.hospitalizations, "Госпитализации (длительность; причины)", (value){
          realPregnancy.hospitalizations = value;
        }),
        formElement(realPregnancy.treatment, "Лечение", (value){
          realPregnancy.treatment = value;
        }),
      ],
    );
  }

  final TextEditingController fieldController = TextEditingController();
  final TextEditingController fieldController2 = TextEditingController();
  @override
  void initState() {
    fieldController.text = realPregnancy.lastMenstruationDate;
    fieldController2.text = realPregnancy.firstFetalMovement;
    super.initState();
  }

  Future getDate2() async {
    var date = await getDatePicker(context);
    String formattedDate = DateFormat('dd MMMM yyyy', "ru").format(date);
    this.setState(() {
      realPregnancy.firstFetalMovement = formattedDate;
      fieldController2.text = realPregnancy.firstFetalMovement;
    });
  }

  Future getDate() async {
    var date = await getDatePicker(context);
    String formattedDate = DateFormat('dd MMMM yyyy', "ru").format(date);
    this.setState(() {
      realPregnancy.lastMenstruationDate = formattedDate;
      fieldController.text = realPregnancy.lastMenstruationDate;
    });
  }
}
