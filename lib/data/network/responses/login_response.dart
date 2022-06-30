import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

class LoginResponse {
  late int status;
  late LoginResponseAccount account;
  LoginResponse.fromJson(Map<String, dynamic>? json) {
    this.status = json?['status'];
    this.account = LoginResponseAccount.fromJson( json?['account'][0]);
  }
}

class LoginResponseAccount {
  late dynamic id;
  late String name;
  late String email;
  late String password;
  late String phone;
  late String updated_at;
  late String created_at;

  LoginResponseAccount.fromJson(Map<String, dynamic>? json) {
    this.id = json?['id'];
    this.name = json?['name'];
    this.email = json?['email'];
    this.password = json?['password'];
    this.phone = json?['phone'];
    this.updated_at = json?['updated_at'];
    this.created_at = json?['created_at'];
  }
}
