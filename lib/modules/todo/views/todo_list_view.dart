import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/todo/controllers/todo_list_controller.dart';
import 'package:todo_app/routes/route.dart';

import '../widgets/todo_tile.dart';

class TodoListView extends GetView<TodoListController> {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do '),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isFetchingTodos.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (controller.todos.isEmpty) {
              return const Center(
                child: Text('No Todos Found!'),
              );
            } else {
              return ListView.builder(
                itemCount: controller.todos.length,
                itemBuilder: (context, index) {
                  final todo = controller.todos[index];
                  return TodoTile(controller: controller, todo: todo);
                },
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.toNamed(Routes.addTodoView)!.then((value) {
            if(value != null){
              controller.addTodo(value);
            }
          });
        },
      ),
    );
  }
}
