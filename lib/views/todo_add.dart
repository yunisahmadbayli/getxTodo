import "package:flutter/material.dart";
import "package:get/get.dart";
import "../model/model.dart";
import "../controller/controller.dart";
import "package:uuid/uuid.dart";

class ToDoAdd extends StatelessWidget {
  TextEditingController titleControl = TextEditingController();
  TextEditingController descControl = TextEditingController();
  final getx = Get.find<TaskController>();
  final uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add_task".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: titleControl,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                     borderSide: BorderSide(
                      width: 3,
                      color: Colors.greenAccent
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(width: 2,color: Colors.greenAccent)
                  ),
                  labelText: "title".tr,
                  labelStyle : TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: descControl,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(width: 2, color: Colors.greenAccent)),
                  labelText: "description".tr,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 30),
            Container(
              width: 120,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    getx.addTask(Task(
                        id: uuid.v1(),
                        title: titleControl.text,
                        description: descControl.text));
                    Get.showSnackbar(
                      GetSnackBar(
                        title: 'new_task'.tr,
                        message: 'new_task_msg'.tr,
                        duration: Duration(milliseconds: 1100),
                        backgroundColor: Colors.green.shade400,
                        borderRadius: 8.0,
                      )
                    );
                  },
                  child: Text("save".tr),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
