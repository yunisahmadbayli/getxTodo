import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_title': 'TODO App',
          'add_task' : "Add Task",
          'title' : 'Title',
          'description' : 'Description',
          'save' : 'Save',
          'new_task' : "New Task",
          'new_task_msg': "Succesfully added" ,
          'edit' : 'Edit',
          'cancel' :'Cancel',
          'update' : 'Update',
          'assignment_del' : 'Assignment Deleted',
          'del_msg' : 'The assignment deleted succesfully'
        },
        'tr_TR': {
          'app_title': 'TODO Uygulaması',
          'add_task' : 'Görev Ekle',
          'title' : 'Başlık',
          'description' : 'Açıklama',
          'save' : 'Kaydet',
          'new_task' : 'Yeni Görev',
          'new_task_msg' : 'Listenize eklendi',
          'edit' : "Düzenleme",
          'cancel' : 'İptal Et',
          'update': 'Güncelle',
          'assignment_del' : 'Görev Silindi',
          'del_msg' : 'Görev listesinden kaldırıldı'
        }
      };
}
