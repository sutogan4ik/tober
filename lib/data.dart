
class Answer{
  String title;
  int point = 0;
  int position;
  bool state = false;
  Answer(this.position, this.title);
}

class PageData{
  String title;
  List<Answer> answers;
  PageData(this.title, this.answers);
}