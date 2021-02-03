
import 'package:flutter/material.dart';
import 'package:tober/data/user.dart';
import 'package:tober/widgets.dart';

class ReproductiveFunctionPage extends StatefulWidget {
  @override
  _ReproductiveFunctionPageState createState() => _ReproductiveFunctionPageState();
}

class _ReproductiveFunctionPageState extends State<ReproductiveFunctionPage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.all(16.0)),
        Text("Детородная функция",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start),
        formElement(reproductiveFunction.pregnanciesCount, "Количество беременностей", (value){
          reproductiveFunction.pregnanciesCount = value;
        }),
        formElement(reproductiveFunction.birthsCount, "Количество родов", (value){
          reproductiveFunction.birthsCount = value;
        }),
        formElement(reproductiveFunction.laborProcess, "Процесс протекания родов (срочность, осложнения родового процесса)", (value){
          reproductiveFunction.laborProcess = value;
        }),
        formElement(reproductiveFunction.heightWeightChild, "Рост, вес ребенка", (value){
          reproductiveFunction.heightWeightChild = value;
        }),
        formElement(reproductiveFunction.breastfeedingPeriod, "Период времени кормления грудью", (value){
          reproductiveFunction.breastfeedingPeriod = value;
        }),
        formElement(reproductiveFunction.abortion, "Аборт (был/ не был; если был: самопроизвольный или искусственный; срок беременности; осложнения)", (value){
          reproductiveFunction.abortion = value;
        }),
      ],
    );
  }
}
