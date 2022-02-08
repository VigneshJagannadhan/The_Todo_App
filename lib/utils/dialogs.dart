import 'package:flutter/material.dart';

showAddedTodoAlert(context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Todo Added Successfully!'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('View Todos'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Add another'),
              )
            ],
          ));
}
