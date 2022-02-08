import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_todo_app/models/todo_model.dart';
import 'package:the_todo_app/providers/_mixins.dart';
import 'package:the_todo_app/providers/base_provider.dart';

class TodoProvider extends BaseProvider with MixinProgressProvider {
  List<TodoModel> _todoList = <TodoModel>[];
  List<TodoModel> get todoList => _todoList;

  set todoList(List<TodoModel> val) {
    _todoList = val;
    notifyListeners();
  }

  String docId = '';
  final todo = FirebaseFirestore.instance.collection("todos");

  Future<void> addTodo({
    required todoTitle,
    required todoSubtitle,
    required isCompleted,
    required isPriority,
    required category,
  }) {
    // final todo = FirebaseFirestore.instance.collection("todos");
    return todo.add({
      'todoTitle': todoTitle,
      'todoSubtitle': todoSubtitle,
      'isCompleted': isCompleted,
      'isPriority': isPriority,
      'category': category,
    }).then((value) => docId = value.id);
  }

  /// Function to delete a todo.
  Future<void> deleteTodo(index) async {
    final cart = await FirebaseFirestore.instance.collection("todos").get();
    String docId = (cart.docs.elementAt(index).id);

    await FirebaseFirestore.instance.collection("todos").doc(docId).delete();
    return notifyListeners();
  }

  Future<TodoModel?> fetchTodos() async {
    isLoading = true;
    try {
      await FirebaseFirestore.instance
          .collection("todos")
          .get()
          .then((value) async {
        _todoList = value.docs
            .map(
              (doc) => TodoModel.fromJson(
                doc.data(),
              ),
            )
            .toList();
      }).catchError((err) => print(err));
    } catch (ex) {
      print(ex.toString());
    } finally {
      isLoading = false;
    }
  }

  Future<void>? setCategory(category, value) {
    category = value;
    notifyListeners();
  }
}
