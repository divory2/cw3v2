import 'package:flutter/material.dart';
import 'package:cw3v2/completeTaskList.dart';

class TaskListScreen extends StatefulWidget {
  final List<String> taskList;

  TaskListScreen({required this.taskList});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  Map<String, bool> selectedTask = {};
  List<String> checkedTasks = [];
  List<String> uncheckedTasks = [];

  @override
  void initState() {
    super.initState();
    // Initialize all tasks as unchecked
    uncheckedTasks = List.from(widget.taskList);
    for (var task in widget.taskList) {
      selectedTask[task] = false;
    }
  }

  void _taskSelection(String task, bool? value) {
    setState(() {
      selectedTask[task] = value ?? false;

      if (value == true) {
        if (!checkedTasks.contains(task)) checkedTasks.add(task);
        uncheckedTasks.remove(task);
      } else {
        if (!uncheckedTasks.contains(task)) uncheckedTasks.add(task);
        checkedTasks.remove(task);
      }
    });
  }

  void _sendCompletedList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompleteTaskListScreen(completedTask: checkedTasks),
      ),
    );
  }
  void _sendUncheckedCompletedList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompleteTaskListScreen(completedTask: uncheckedTasks),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your List of Tasks'),
      ),
      body: Column(
        children: [
          Expanded(
            child: widget.taskList.isEmpty
                ? Center(child: Text('You do not have any tasks in your list'))
                : ListView.builder(
                    itemCount: widget.taskList.length,
                    itemBuilder: (context, index) {
                      String task = widget.taskList[index];
                      return ListTile(
                        title: Text(task),
                        leading: Checkbox(
                          value: selectedTask[task] ?? false,
                          onChanged: (bool? value) {
                            _taskSelection(task, value);
                          },
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _sendCompletedList,
              child: Text('View Your Completed Tasks'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _sendUncheckedCompletedList,
              child: Text('View your incomplete Task'),
            ),
          ),
        ],
      ),
    );
  }
}
