import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoListController extends GetxController {
  final todos = <TodoModel>[].obs;

  final isFetchingTodos = false.obs;
  final firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<void> getTodos() async {
    try {
      isFetchingTodos(true);
      final _data = await firebaseFirestore.collection('todos').get();
      List<TodoModel> _todos = _data.docs
          .map((element) => TodoModel.fromJson(element.data()))
          .toList();
      _todos.sort(((a, b) => b.date.compareTo(a.date)));
      todos(_todos);

      isFetchingTodos(false);
    } catch (e) {
      isFetchingTodos(false);
      Get.showSnackbar(const GetSnackBar(message: 'Unable to fetch todos'));
    }
  }

  Color getTabColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'work':
        return Colors.green;
      case 'school':
        return Colors.blue;
      default:
        return Colors.red;
    }
  }

  void addTodo(Map<String, dynamic> value) {
    final _todo = TodoModel.fromJson(value);
    final _newTodos = [_todo, ...todos];
    todos(_newTodos);
  }
}
