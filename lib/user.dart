import 'package:equatable/equatable.dart';

class User extends Equatable{

  String name;
  String email;

  User({this.email, this.name});

  @override
  List<Object> get props => [name, email];


}