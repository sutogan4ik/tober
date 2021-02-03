
import 'package:flutter/material.dart';

class Answer{
  String title;
  int point = 0;
  int position;
  bool state = false;
  Answer(this.position, this.title, this.point);
}

class PageData{
  String title;
  List<Answer> answers;
  PageData(this.title, this.answers);
  List<Answer> results = [];
}

class Group{
  String title;
  String type;
  int number;
  int count = 0;
  Color color;
  List<String> titles = [];
  Group(this.title, this.type, this.number, this.color);
}