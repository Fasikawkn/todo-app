class TodoModel {
  late String title;
  String? description;
  late String tag;
  late DateTime date;

  TodoModel({
    required this.title,
    this.description,
    required this.tag,
    required this.date,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    tag = json['tag'];
    date = DateTime.parse(json['date']);
  }
}
