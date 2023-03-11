class Task {
  String? id;
  String? title;
  String? description;

  Task({this.id, this.title, this.description});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
// class Task {
//   final String id;
//   final String title;
//   final String description;

//   Task({
//     required this.id,
//     required this.title,
//     required this.description ,
//   });

//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       id: json['id'],
//       title: json['title'],
//       description: json['isDone'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'title': title,
//         'isDone': description,
//       };
// }
