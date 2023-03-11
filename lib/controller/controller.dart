

import "package:get/get.dart";
import "../model/model.dart";
import "package:get_storage/get_storage.dart";

class TaskController extends GetxController{
  var lang  = "EN".obs;
  final tasks = <Task>[].obs ;
  var box = GetStorage();
  

  @override 
  void onInit() {
    super.onInit();
    loadTasks();
  }

   void changeLang(){
    if(lang == "EN"){
      lang.value = "TR";
    }else {
      lang.value = "EN";
    }
  }

  void loadTasks() async{
    final taskJson = await box.read<List>('tasks') ?? [].toList();
    tasks.assignAll(taskJson.map((json) => Task.fromJson(json)).toList());
  }

  void addTask(Task task){
    tasks.add(task);
    box.write('tasks', tasks);
    // box.write('task',tasks.map((todo) => todo.toJson()).toList());  
  }

  void deleteTask(String id){
    tasks.removeWhere((task) => task.id == id);
    box.write('tasks', tasks);
  }

  void updateTask(int index ,String newTitle,String newDesc) {
    
      tasks[index].title = newTitle;
      tasks[index].description = newDesc;
      box.write('tasks', tasks);
      
    
  }

}