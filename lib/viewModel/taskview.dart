

import 'package:flutter/material.dart';
import 'package:todo_App/models/task.dart';

class TaskView extends ChangeNotifier{

  List<Task> tasks=[];

  String? taskName;

  final TextEditingController dateCont = TextEditingController();
  final TextEditingController timeCont = TextEditingController();

  bool get isValid => taskName!=null && dateCont.text.isNotEmpty && timeCont.text.isNotEmpty;

  setName(String? value){
    taskName =value;
    notifyListeners();
  }

  setDate(DateTime? date){
    if(date==null){
      return;
    }

    DateTime currentdate = DateTime.now();
    DateTime now =DateTime(currentdate.year, currentdate.month, currentdate.day);

    // now and currentDate are same but we use now for to find the difference
    // beacuse the currentDate also contains the time

    int diff = date.difference(now).inDays;

    if(diff == 0){
      dateCont.text ="Today";
    }
    else if(diff ==1){
      dateCont.text="Tomorrow";
    }
    else{
      dateCont.text = "${date.day}-${date.month}-${date.year}";
    }

    notifyListeners();
  }

  setTime(TimeOfDay? time){

    if(time==null){
      return;
    }

    if(time.hour == 0){
      timeCont.text = "12:${time.minute} AM";
    }
    else if(time.hour> 12){
      timeCont.text = "${time.hour - 12}:${time.minute} PM";
    }
    else if(time.hour == 12){
      timeCont.text="${time.hour}:${time.minute} PM";
    }
    else{
      timeCont.text="${time.hour}:${time.minute} AM";
    }

    notifyListeners();
  }

  void addTask(){
    if(!isValid){
      return;
    }
    final Task task = Task(taskName!, dateCont.text, timeCont.text);

    dateCont.clear();
    timeCont.clear();
    tasks.add(task);
    notifyListeners();

  }
}