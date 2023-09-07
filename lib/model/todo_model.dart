class TodoModel {
  late int userId;
  late int id;
  late String title;
  late bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userId'] = userId;
    json['id'] = id;
    json['title'] = title;
    json['completed'] = completed;
    return json;
  }
}