
class Task{

  String name;
  String date;
  String time;

  Task(
    this.name,
    this.date,
    this.time,
  );

  Map<String,dynamic> toJson(){
    return {
      'name': name,
      'date': date,
      'time': time,
    };
  }

  factory Task.fromJson(Map<String,dynamic> json){
    return Task(json['name'],json['date'],json['time']);
  }
}