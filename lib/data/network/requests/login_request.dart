import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

class LoginRequest {
  String? email;
  String? password;
  LoginRequest({this.email,  this.password}) {
    
  }
}
