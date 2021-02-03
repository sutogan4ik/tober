
import 'package:flutter/material.dart';

Widget formElement(value, hint, valueListener, [tapListener, keyboardType, textEditingController]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(padding: const EdgeInsets.all(12.0)),
      Text(
        hint,
        textWidthBasis: TextWidthBasis.parent,
        style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w400),
        textAlign: TextAlign.start,
      ),
      TextFormField(
          initialValue: value,
          controller: textEditingController,
          keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
          onChanged: tapListener == null ? valueListener : null,
          onTap: tapListener != null ? tapListener : null,
          readOnly: tapListener != null,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ))
    ],
  );
}

Future<DateTime> getDatePicker(BuildContext context) async{
  DateTime selectedDate = DateTime.now();
  final DateTime picked = await showDatePicker(
      context: context,
      locale: Locale('ru', 'RU'),
      initialDate: selectedDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2030));
  return picked;
}