// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:the_todo_app/screens/add_todo_screen.dart';
import 'package:the_todo_app/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  static const String route = 'main_screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          width: deviceSize.width,
          height: deviceSize.height,
          child: TabBarView(children: const [
            HomeScreen(),
            AddTodoScreen(),
          ]),
        ),
        bottomNavigationBar: TabBar(labelColor: Colors.black, tabs: const [
          Tab(
            text: 'Todos',
            icon: Icon(
              Icons.check_box_outlined,
            ),
          ),
          Tab(
            text: 'Add a Todo',
            icon: Icon(Icons.task),
          ),
        ]),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () =>
        //       Navigator.of(context).pushReplacementNamed(AddTodoScreen.route),
        // ),
      ),
    );
  }
}
