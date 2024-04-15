import 'package:task_manger/models/task_model.dart';
import 'package:task_manger/screens/add_task_screen/models/task.dart';

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.active,
    this.tasks,
    this.friends,
    this.categories,
    this.v,
  });
  String? id = "1";
  String? name;
  String? email;
  String? password;
  final bool? active;
  String image = "assets/images/Profile_pic.png";
  final List<dynamic>? categories;
  List<Data>? tasks;
  List<dynamic>? friends;
  final int? v;
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        active: json['active'] as bool?,
        friends: json['Friends'] as List<dynamic>,
        tasks: (json['Tasks'] as List<dynamic>?)
            ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
        categories: json['Categories'] as List<dynamic>?,
        v: json['__v'] as int?,
      );

  // String get email => _email;
  // String? get password => _password;
  // String get imgAsset => _imgAsset;
  // List<User> get friends => _friends;
  // int get lenght => _friends.length;
  // set name(String value) {
  //   _name = value;
  // }

  //set email(String value) {
  //email = value;
  //}

  // set password(String? value) {
  //   _password = value;
  // }

  void addFriend(User friend) {
    friends!.add("");
  }
}

class Friend {
  String? id;
  String? name;
  Friend({this.id, this.name});
  factory Friend.fromjson(Map<String, dynamic> json) => Friend(
        id: json['_id'],
        name: json['name'],
      );
}
