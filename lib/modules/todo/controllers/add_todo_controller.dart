import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String? tag;

  final addEditState = false.obs;
  final formKey = GlobalKey<FormState>();

  final tagItems = ["Work", "School", "Other"];

  final firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addTodo() async {
    try {
      if (formKey.currentState!.validate()) {
        addEditState(true);
        final _todo = {
          "title": titleController.text,
          "tag": tag,
          "date": DateTime.now().toString(),
        };
        if (descriptionController.text.isNotEmpty) {
          _todo["description"] = descriptionController.text;
        }
        await firebaseFirestore
            .collection("todos")
            .add(_todo)
            .catchError((error) {
          Get.showSnackbar(const GetSnackBar(
            message: 'Error when adding todo',
          ));
          return error;
        });

        Get.back(result: _todo);
        addEditState(false);
      }
    } catch (e) {
      addEditState(false);
      Get.showSnackbar(const GetSnackBar(
        message: 'Error when adding todo',
      ));
    }
  }
}
