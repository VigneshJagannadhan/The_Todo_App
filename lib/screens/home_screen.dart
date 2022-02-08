import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/providers/todo_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TodoProvider _todoProvider;

  @override
  void initState() {
    _todoProvider = TodoProvider();
    Future.microtask(() => _initAsync());
    super.initState();
  }

  @override
  void dispose() {
    _todoProvider.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: _todoProvider)],
        builder: (context, _) {
          return Consumer<TodoProvider>(builder: (context, provider, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: deviceSize.width,
                      height: deviceSize.height,
                      child:
                          //   Consumer<TodoProvider>(builder: (context, provider, _) {
                          // return
                          ListView.builder(
                        itemCount: provider.todoList.length,
                        itemBuilder: (context, index) {
                          print(provider.todoList.length);
                          return SizedBox(
                            width: deviceSize.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(10),
                                tileColor: provider.todoList[index].isPriority!
                                    ? Colors.green.shade100
                                    : Colors.grey.shade300,
                                leading: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(provider.todoList[index].category
                                        .toString()),
                                    provider.todoList[index].isCompleted!
                                        ? const Icon(
                                            Icons.check_box,
                                            color: Colors.green,
                                          )
                                        : const Icon(
                                            Icons.check_box_outline_blank,
                                            color: Colors.red,
                                          ),
                                  ],
                                ),
                                title: Text(
                                  provider.todoList[index].iTodoTitle ??
                                      'Loading...',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                                subtitle: Text(
                                  provider.todoList[index].iTodoSubTitle ??
                                      'Loading...',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                ),
                                trailing: IconButton(
                                  onPressed: () async {
                                    await provider.deleteTodo(index);
                                    await provider.fetchTodos();
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                      // }),
                      ),
                ],
              ),
            );
          });
        });
  }

  _initAsync() async {
    await _todoProvider.fetchTodos();
  }
}
