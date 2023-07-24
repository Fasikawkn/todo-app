import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/todo_model.dart';
import '../controllers/todo_list_controller.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.controller,
    required this.todo,
  });

  final TodoListController controller;
  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      padding: const EdgeInsets.only(left: 7.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: controller.getTabColor(todo.tag)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 20, 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10.0),
              topRight: Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(
                0.1,
              ),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    todo.title,
                    style: Get.textTheme.titleMedium!.copyWith(fontSize: 17),
                  ),
                ),
                Text(
                  DateFormat('hh:mm a dd MMM, yyyy').format(todo.date),
                  style: Get.textTheme.bodySmall!.copyWith(
                    fontSize: 10
                  ),
                ),
              ],
            ),
            todo.description != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      todo.description!,
                      style: Get.textTheme.labelLarge!.copyWith(
                        color: Colors.grey.shade500
                      ),

                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
