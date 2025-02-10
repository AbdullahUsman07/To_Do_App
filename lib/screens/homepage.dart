import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_App/constants/colors.dart';
import 'package:todo_App/models/task.dart';
import 'package:todo_App/viewModel/taskview.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        backgroundColor: primary,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: Icon(
                Icons.check,
                size: 15,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text("To Do App",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20))
          ],
        ),
      ),
      body: Consumer<TaskView>(
        builder: (context,taskProvider,_){
        return ListView.separated(
          itemBuilder: (context, index) {
            final Task task =taskProvider.tasks[index];
            return taskWidget(task:task);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              thickness: 1,
              color: primary,
            );
          },
          itemCount: taskProvider.tasks.length,
        );
        }
      ),
  
      floatingActionButton: AddTaskButton(),
    );
  }
}

class taskWidget extends StatelessWidget {
  const taskWidget({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.name,
          style: const TextStyle(color: Colors.white)),
      subtitle:
          Text("${task.date}, ${task.time}", style: TextStyle(color: primary)),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  AddTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;

    final taskProvider = Provider.of<TaskView>(context, listen: false);

    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: primary,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: primary,
                child: Container(
                    width: sw * 0.7,
                    height: sh * 0.6,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sw * 0.05, vertical: sh * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "New Task",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )),
                          const Text("What is to be done",
                              style: TextStyle(
                                  color: secondary,
                                  fontWeight: FontWeight.w500)),
                          CustomInputFeild(
                            title: "Create New Task",
                            onChanged: (value) {
                              taskProvider.setName(value);
                            },
                          ),
                          const SizedBox(height: 50),
                          const Text("What is to be done",
                              style: TextStyle(
                                  color: secondary,
                                  fontWeight: FontWeight.w500)),
                          CustomInputFeild(
                            title: "Enter Date",
                            readOnly: true,
                            icon: Icons.calendar_month,
                            onTap: () async{
                              DateTime? date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2030));

                                  taskProvider.setDate(date);
                            },
                            controller: taskProvider.dateCont,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomInputFeild(
                              title: "Enter Time",
                              readOnly: true,
                              icon: Icons.lock_clock,
                              onTap: ()async{
                                TimeOfDay? time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                                taskProvider.setTime(time);
                              },
                              controller: taskProvider.timeCont,
                              ),
                              
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                  onPressed: () {
                                    taskProvider.addTask();
                                    if(context.mounted){
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text("Create"))),
                        ],
                      ),
                    )),
              );
            });
      },
      child: Icon(Icons.add, size: 40),
    );
  }
}

class CustomInputFeild extends StatelessWidget {
  CustomInputFeild({
    super.key,
    required this.title,
    this.readOnly = false,
    this.icon,
    this.onChanged,
    this.onTap,
    this.controller,
  });

  final String title;
  bool readOnly;
  IconData? icon;
  void Function(String)? onChanged;
  void Function()? onTap;
  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
