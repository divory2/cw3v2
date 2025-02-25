import 'package:flutter/material.dart';


class TaskListscreen extends StatelessWidget {
  final List<String> taskList;
  TaskListscreen({required this.taskList});

  @override
  Widget build(BuildContext context) {


    return Scaffold(

    appBar: AppBar(
      title: Text('Your list of Favorite Recipes'),
    
    ),
    body: taskList.isEmpty? Center(
      child: Text('You do not have any task in your List'),

    ):ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(taskList[index])
        );
      },
    ),


  );
  }
}