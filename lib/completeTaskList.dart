import 'package:flutter/material.dart';


class CompleteTaskListScreen extends StatelessWidget {
  final List<String> completedTask;
  CompleteTaskListScreen({required this.completedTask});

  @override
  Widget build(BuildContext context) {


    return Scaffold(

    appBar: AppBar(
      title: Text('Your list of Favorite Recipes'),
    
    ),
    body: completedTask.isEmpty? Center(
      child: Text('You do not have any favorites selected'),

    ):ListView.builder(
      itemCount: completedTask.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(completedTask[index])
        );
      },
    ),


  );
  }
}