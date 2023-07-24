import 'package:get/get.dart';
import 'package:todo_app/routes/route.dart';

import '../modules/todo/bindings/add_todo_binding.dart';
import '../modules/todo/bindings/todo_list_binding.dart';
import '../modules/todo/views/add_todo_view.dart';
import '../modules/todo/views/todo_list_view.dart';

class AppPages {
  static const intial = Routes.todoListView;

  static final routes = [
    GetPage(
      name: Routes.todoListView,
      page: () => const TodoListView(),
      binding: TodoListBinding(),
    ),
    GetPage(
      name: Routes.addTodoView,
      page: () => const AddTodoView(),
      binding: AddTodoBinding(),
    ),

  ];
}
