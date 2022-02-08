import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/providers/todo_provider.dart';
import 'package:the_todo_app/screens/home_screen.dart';
import 'package:the_todo_app/utils/dialogs.dart';
import 'package:the_todo_app/utils/styles.dart';

class AddTodoScreen extends StatefulWidget {
  static const String route = 'add_todo_screen';
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  // bool isPriority = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController todoTitleController = TextEditingController();
    TextEditingController todoSubtitleController = TextEditingController();
    bool isPriority = false;
    late String? category;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _ThisProvider())
        ],
        builder: (context, _) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: todoTitleController,
                              decoration: const InputDecoration(
                                label: Text('Title'),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              maxLines: 7,
                              controller: todoSubtitleController,
                              decoration: const InputDecoration(
                                label: Text('Content'),
                                // border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Consumer<_ThisProvider>(
                                builder: (context, provider, _) {
                              return Card(
                                elevation: 05,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  height: 60,
                                  width: double.infinity,
                                  child: DropdownButton<String>(
                                    underline: Container(),
                                    hint: const Text('Select a Category'),
                                    borderRadius: BorderRadius.circular(10),
                                    style: tsC00S20,
                                    icon: Container(),
                                    value: provider.category,
                                    onChanged: (value) {
                                      category = value;
                                      provider.setCategory(value);
                                    },
                                    items: [
                                      'Personal',
                                      'Work',
                                      'Music',
                                      'Travel',
                                      'Study',
                                      'Shopping',
                                      'Others'
                                    ]
                                        .map(
                                          (value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              );
                            }),
                            _IsPrioritySectionWidget(
                              isPriority: isPriority,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () => _AddTodo(
                                    todoTitleController: todoTitleController,
                                    todoSubtitleController:
                                        todoSubtitleController,
                                    category: category,
                                    isPriority: isPriority),
                                child: const Text('Submit'),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _AddTodo(
      {required todoTitleController,
      required todoSubtitleController,
      required isPriority,
      required category}) async {
    await Provider.of<TodoProvider>(context, listen: false).addTodo(
        todoTitle: todoTitleController.text,
        todoSubtitle: todoSubtitleController.text,
        isCompleted: false,
        isPriority: isPriority,
        category: category);
    showAddedTodoAlert(context);
  }
}

class _ThisProvider with ChangeNotifier {
  String? category;
  bool? isPriority;

  String? get categoryItem {
    return category;
  }

  bool? get priority {
    return isPriority;
  }

  String? setCategory(value) {
    category = value;
    notifyListeners();
    return category;
  }

  bool? setPriority(value) {
    isPriority = value;
    notifyListeners();
    return isPriority;
  }
}

class _IsPrioritySectionWidget extends StatelessWidget {
  bool? isPriority;
  _IsPrioritySectionWidget({Key? key, required this.isPriority})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Mark as high priority?',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          Consumer<_ThisProvider>(builder: (context, provider, _) {
            return Switch(
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.red.shade100,
              value: isPriority!,
              onChanged: (value) {
                isPriority = value;
                provider.setPriority(value);
              },
            );
          }),
        ],
      ),
    );
  }
}
