import "package:flutter/material.dart";
import "../controller/controller.dart";
import "package:get/get.dart";
import "./todo_add.dart";
import "./todo_item.dart";
import "../translate/translation.dart";

class ToDoList extends StatelessWidget {
  final todoList = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app_title".tr),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: GestureDetector(
                child: Obx(() => Text(
                      todoList.lang.toString(),
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                    )),
                onTap: () {
                  todoList.changeLang();
                  Get.updateLocale(
                    Get.locale == Locale('tr','TR') ? Locale('en','US') : Locale('tr',"TR")
                  );
                  
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(ToDoAdd());
        },
        child: Icon(
          Icons.add,
          color: Colors.blue[900],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Obx(() => ListView.builder(
              // OBX ICINE ALL !!!!!
              itemCount: todoList.tasks.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.alarm),
                title: Text(todoList.tasks[index].title.toString()),
                subtitle: Text(todoList.tasks[index].description.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Get.to(ToDoItem(index));
                      },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          todoList
                              .deleteTask(todoList.tasks[index].id.toString());
                          Get.showSnackbar(GetSnackBar(
                              title: "assignment_del".tr,
                              message: "del_msg".tr,
                              icon: Icon(Icons.done),
                              duration: const Duration(milliseconds: 1500)));
                        },
                        color: Colors.redAccent)
                  ],
                ),
                onTap: () {
                  Get.to(ToDoItem(index));
                },
              ),
            )),
      ),
    );
  }
}
