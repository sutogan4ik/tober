import 'package:flutter/material.dart';
import 'package:tober/data/data.dart';
import 'package:share/share.dart';

class ResultScreen extends StatelessWidget {
  List<PageData> data;
  String res;
  ResultScreen(this.data);

  @override
  Widget build(BuildContext context) {
    for (var dataItem in data) {
      for (var groupItem in groups) {
        for (var answer in dataItem.results) {
          if (answer.point == groupItem.number) {
            groupItem.count++;
            groupItem.titles.add(dataItem.title);
          }
        }
      }
    }

    var totalCount = groups //Общее количество набранных балов
        .map((e) => e.count)
        .toList()
        .reduce((value, element) => value + element);
    int halfCount = totalCount~/2; //половина набранных балов
    var dominationType = "Доминирующий тип не определен";

    List<Group> sortedList = List.from(groups);
    sortedList.sort((a, b) => b.count.compareTo(a.count));

    res = "Тип не определен";
    // если в какой либо группе количество балов равно общему количеству балов диагностируем чистый тип
    if(groups.map((e) => e.count).contains(totalCount)){//определяем чистый тип
        var group = groups
            .where((element) => element.count == totalCount)
            .first;
        res = "Чистый ${group.type} ${group.title} тип отношения к беременности";

    }else{
      //ищем тип у которого количество балов больше чем половина всех балов
      if(sortedList[0].count >= halfCount){//ищем доминирующий тип
        dominationType = "${sortedList[0].type} ${sortedList[0].title} доминирующий тип отношения к беременности";
        res = dominationType;
      }else{
        List<Group> doubleType = sortedList.sublist(0, 2);
        List<Group> lastGroups = sortedList.sublist(2);//забираем оставшиеся группы по возрастанию
        var lastSum = lastGroups //Общее количество балов по оставшимся группам
            .map((e) => e.count)
            .toList()
            .reduce((value, element) => value + element);

        var sum = doubleType[0].count + doubleType[1].count;
        if(sum > halfCount){
          if(doubleType[0].count <= lastSum && (doubleType[0].count - doubleType[1].count) >= 3){
            res = "${doubleType[1].type} ${doubleType[1].title} чистый доминирующий тип отношения к беременности";
          }else{
            res = "Смешанный ${doubleType[0].type} ${doubleType[0].title} ${doubleType[1].type} ${doubleType[1].title} тип отношения к беременности";
          }
        }else{
          var first = sortedList[0].count < halfCount;
          var second = (sortedList[0].count + sortedList[1].count) < halfCount;
          var three = (sortedList[0].count + sortedList[1].count + sortedList[2].count) >= halfCount;
          var four = (sortedList[0].count - sortedList[1].count) <=2 && (sortedList[1].count - sortedList[2].count) <= 2;

          if(first && second && three && four){
            res = "Дифузный тип отношения к беременности";
          }else{
            res = "Полученные результаты не дают основания для выделения какого-либо определенного типа отношения к беременности";
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Результаты теста"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text("Группа ТОБер",
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("Кол-во балов",
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  )
                ],
              ),
              for (var item in sortedList)
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                item.title,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${item.count}",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Flexible(
                              flex: 5,
                              fit: FlexFit.loose,
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  height: 10,
                                  child: SizedBox(
                                    width: (item.count * 30 + 5).toDouble(),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(color: item.color),
                                    ),
                                  )),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var itemTitle in item.titles)
                                Text(
                                  itemTitle,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                )
                            ],
                          ),
                        )
                      ],
                    )),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Всего балов:",
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      totalCount.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  res,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: RaisedButton(
                    child: Text("Отправить результат теста"),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: (){
                    Share.share("text");
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Group> groups = [
    Group("Гармоничный", "Адекватный", 1, Colors.amber),
    Group("Эргопатический", "Условно адекватный", 2, Colors.cyan),
    Group("Инфантильный эйфорический", "Условно адекватный", 3, Colors.deepPurple),
    Group("Дисфорический враждебный", "Неадекватный", 6, Colors.deepOrangeAccent),
    Group("Тревожный сензитивный", "Неадекватный", 4, Colors.lightGreen),
    Group("Тревожный ипохондрический", "Неадекватный", 5, Colors.teal),
    Group("Неврастенический", "Неадекватный", 7, Colors.blue),
    Group("Эгоцентрический", "Неадекватный", 8, Colors.red),
  ];
}
