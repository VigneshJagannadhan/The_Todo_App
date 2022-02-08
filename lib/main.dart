import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/providers/todo_provider.dart';
import 'package:the_todo_app/screens/add_todo_screen.dart';
import 'package:the_todo_app/screens/home_screen.dart';
import 'package:the_todo_app/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TodoProvider())
        ],
        builder: (context, _) {
          return MaterialApp(
            home: const MainScreen(),
            initialRoute: MainScreen.route,
            routes: {
              HomeScreen.route: (context) => const HomeScreen(),
              MainScreen.route: (context) => const MainScreen(),
              AddTodoScreen.route: (context) => const AddTodoScreen(),
            },
          );
        });
  }
}
