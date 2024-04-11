import 'package:equatable/equatable.dart';
import 'package:task_manger/screens/add_task_screen/models/task.dart';

class UserAccount extends Equatable {
  final String? id;
  String? name;
  String? email;
  String? password;
  String? image;
  final bool? active;
  final List<Task> tasks = [];
  final List<dynamic>? categories;
  final List<UserAccount> friends = [];
  final int? v;

  UserAccount({
    this.id,
    this.name,
    this.email,
    this.active,
    this.categories,
    this.v,
  });
  factory UserAccount.addFriend(UserAccount friend) => UserAccount(
      id: friend.id,
      name: friend.name,
      email: friend.email,
      active: friend.active,
      categories: friend.categories,
      v: friend.v);
  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        active: json['active'] as bool?,
        categories: json['Categories'] as List<dynamic>?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'active': active,
        'Tasks': tasks,
        'Categories': categories,
        'Friends': friends,
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      active,
      tasks,
      categories,
      friends,
      v,
    ];
  }

  void addFriend(UserAccount friend) {
    friends.add(friend);
  }
}
