import 'package:flutter/material.dart';
import 'package:tober/data/user.dart';
import 'package:tober/general_info_page.dart';
import 'package:tober/instruction_page.dart';
import 'package:tober/real_pregnancy_page.dart';
import 'package:tober/reproductive_page.dart';
import 'package:tober/sexual_function_page.dart';

import 'characteristic_page.dart';

enum FormState {
  GENERAL,
  CHARACTERISTICS,
  SEXUAL_FUNCTION,
  REPRODUCTION_FUNCTION,
  REAL_PREGNANCY,
  INSTRUCTION
}

class AnamnesisPage extends StatefulWidget {
  @override
  _ImplAnamnesisPage createState() => _ImplAnamnesisPage();
}

class _ImplAnamnesisPage extends State<AnamnesisPage> {
  FormState formState = FormState.GENERAL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Методика ТОБер"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(children: [
                Text("Акушерско-гинекологический анамнез",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),

                _getFormWithState(formState),

                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        child: Text("Назад"),
                        onPressed: formState != FormState.GENERAL ? (){
                            setState(() {
                              switch(formState){

                                case FormState.GENERAL:
                                  break;
                                case FormState.CHARACTERISTICS:
                                  formState = FormState.GENERAL;
                                  break;
                                case FormState.SEXUAL_FUNCTION:
                                  formState = FormState.CHARACTERISTICS;
                                  break;
                                case FormState.REPRODUCTION_FUNCTION:
                                  formState = FormState.SEXUAL_FUNCTION;
                                  break;
                                case FormState.REAL_PREGNANCY:
                                  formState = FormState.REPRODUCTION_FUNCTION;
                                  break;
                                case FormState.INSTRUCTION:
                                  formState = FormState.REAL_PREGNANCY;
                                  break;
                              }
                            });
                        } : null,
                      ),
                      RaisedButton(
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        child: Text("Далее"),
                        onPressed: () {
                          setState(() {
                            switch(formState){
                              case FormState.GENERAL:
                                formState = FormState.CHARACTERISTICS;
                                break;
                              case FormState.CHARACTERISTICS:
                                formState = FormState.SEXUAL_FUNCTION;
                                break;
                              case FormState.SEXUAL_FUNCTION:
                                formState = FormState.REPRODUCTION_FUNCTION;
                                break;
                              case FormState.REPRODUCTION_FUNCTION:
                                formState = FormState.REAL_PREGNANCY;
                                break;
                              case FormState.REAL_PREGNANCY:
                                //formState = FormState.INSTRUCTION;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InstructionPage()),
                                );
                                break;
                              default:
                                formState = FormState.GENERAL;
                                break;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ));
  }

  Widget _getFormWithState(state){
    switch(state){
      case FormState.GENERAL:
        return GeneralPage();
      case FormState.CHARACTERISTICS:
        return CharacteristicsPage();
      case FormState.SEXUAL_FUNCTION:
        return SexualFunctionPage();
      case FormState.REPRODUCTION_FUNCTION:
        return ReproductiveFunctionPage();
      case FormState.REAL_PREGNANCY:
        return RealPregnancyPage();
      case FormState.INSTRUCTION:
        return InstructionPage();
    }
    return GeneralPage();
  }
}
