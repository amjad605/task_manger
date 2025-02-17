import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String image;
  User({required this.id, required this.name, required this.image});

  @override
  String toString() => name;

  @override
  List<Object?> get props => [id, name, image];
}
