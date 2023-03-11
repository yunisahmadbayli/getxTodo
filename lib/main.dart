import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:get_storage/get_storage.dart";
import 'package:getx_todo/translate/translation.dart';
import 'package:getx_todo/views/todo_list.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'UK'),
      home: ToDoList(),
      theme: ThemeData.dark(),
    );
  }
}
