class TaskModel {
  String? status;
  List<Data>? data;

  TaskModel({this.status, this.data});

  TaskModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? sId;
  String? name;
  String? description;
  String? priority;
  String? category;
  int? points;
  List<String> subTasks = [];
  List<String>? userId;
  String? deadline;
  String? finishedAt;
  String? startedAt;
  String? createdAt;
  int? iV;

  Data({this.sId, this.name, this.createdAt, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    priority = json['priority'];
    category = json['category'];
    subTasks = List<String>.from(json["subtasks"]);
    points = json['points'];
    deadline = json['deadline'];
    finishedAt = json['finished_at'];
    startedAt = json['started_at'];
    userId = (json['user_id'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
    createdAt = json['created_at'];
    iV = json['__v'];
  }
}
