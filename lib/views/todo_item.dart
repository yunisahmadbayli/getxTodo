import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:getx_todo/views/todo_list.dart';
import "../controller/controller.dart";
import "../model/model.dart";
import "package:uuid/uuid.dart";

class ToDoItem extends StatelessWidget {
  
  final int index  ;
  ToDoItem(this.index);
  final TaskController todos = Get.find();
 
  late TextEditingController titleControl = TextEditingController(text: todos.tasks[index].title);
  late TextEditingController descControl = TextEditingController(text:todos.tasks[index].description);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("edit".tr)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: titleControl,),
            const SizedBox(height: 20),
            TextField(controller: descControl),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: (){Get.back();}, child: Text('cancel'.tr)),
                const SizedBox(width: 20,),
                ElevatedButton(onPressed: () {
                   todos.updateTask(index, titleControl.text, descControl.text);
                  Get.to(ToDoList());
                }, child: Text('update'.tr))
              ],
            )
          ],
        ),
      )
    );
  }
}