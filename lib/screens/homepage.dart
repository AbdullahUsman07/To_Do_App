

import 'package:flutter/material.dart';
import 'package:todo_App/constants/colors.dart';

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
        title: const Row(children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: Icon(Icons.check,size: 15,),
          ),
          SizedBox(width: 10,),
          Text("To Do App",style:TextStyle(color:Colors.white,fontWeight: FontWeight.w500,fontSize: 20))
        ],),
      ),
      body: ListView.separated(itemBuilder: (context, index){
        return ListTile(
          title: const Text("Doctor's Appointment",style:TextStyle(color:Colors.white)),
          subtitle: const Text("due tomorrow 11:45 am",style:TextStyle(color:primary)),
        );
      },
       separatorBuilder: (context,index){
        return Divider(
          height: 1,
          thickness: 1,
          color: primary,
        );
       }, itemCount: 5,
       ),
       floatingActionButton: AddTaskButton(),
    );
  }
}

class AddTaskButton extends StatelessWidget {
   AddTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    double sw =MediaQuery.sizeOf(context).width;
    double sh =MediaQuery.sizeOf(context).height;

    return FloatingActionButton(onPressed: (){
      showDialog(context: context, builder: (context){
        return Dialog(
          backgroundColor: primary,
          child: Container(
            width: sw *0.7,
            height: sh*0.6,
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: sw*0.05, vertical : sh *0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Align(
                  alignment: Alignment.center,
                  child: const Text("New Task",style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)),
                Text("What is to be done",style:TextStyle(color:secondary,fontWeight: FontWeight.w500)),
                CustomInputFeild(title: "Create New Task",),
                const SizedBox(height:50),
                Text("What is to be done",style:TextStyle(color:secondary,fontWeight: FontWeight.w500)),
                CustomInputFeild(title: "Enter Date",readOnly: true,icon: Icons.calendar_month,),
                const SizedBox(height: 10,),
                CustomInputFeild(title: "Enter Time",readOnly: true,icon:Icons.lock_clock),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(onPressed: (){}, child: const Text("Create"))),
              ],),
            )
          ),
        );
      });
    },
    child: Icon(Icons.add,size:40),
    );
  }
}

class CustomInputFeild extends StatelessWidget {
  CustomInputFeild({
    super.key,
    required this.title,
    this.readOnly=false,
    this.icon,
  });

  final String title;
  bool readOnly;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: const TextStyle(color:Colors.grey),
        suffixIcon: Icon(icon,color: Colors.white,),
      ),
      
    );
  }
}

  


