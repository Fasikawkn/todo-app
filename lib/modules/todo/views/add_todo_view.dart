import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/todo/controllers/add_todo_controller.dart';

class AddTodoView extends GetView<AddTodoController> {
  const AddTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Too'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: const Text('Title'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: controller.descriptionController,
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                  label: const Text('Description'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              DropdownButtonFormField(
                  value: controller.tag,
                  validator: (value) {
                    if (value == null) {
                      return 'Tag cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text('Tag'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  items: controller.tagItems
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.tag = value;
                    controller.update();
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => AbsorbPointer(
          absorbing: controller.addEditState.value,
          child: Opacity(
            opacity: controller.addEditState.value ? 0.5 : 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onPressed: controller.addTodo,
                child: Center(
                  child: Text(
                    controller.addEditState.value ? 'Saving...' : 'Save',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
