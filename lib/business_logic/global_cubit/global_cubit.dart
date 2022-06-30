import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/main.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  bool passwordVisabilty = true;
  bool en = false;
  Account? account;
  void changePasswordVisabilty() {
    passwordVisabilty = !passwordVisabilty;
    emit(GlobalPasswordVisabilty());
  }

  void changeLocale() async {
    if (en == false) {
      await CacheHelper.saveDataSharedPreference(key: 'language', value: 'en');
    } else {
      await CacheHelper.saveDataSharedPreference(key: 'language', value: 'ar');
    }
    en = !en;
    await delegate.changeLocale(Locale(
        CacheHelper.getDataFromSharedPreference(key: 'language') ?? 'en'));
    emit(GlobalChangeLocale());    
  }

  void login(LoginRequest request) {
    emit(GlobalLoginLoading());
    DioHelper.postData(
            url: LOGIN,
            body: {'email': request.email, 'password': request.password})
        .then((value) {
      if (value.data['status'] == 200) {
        LoginResponseAccount v = LoginResponse.fromJson(value.data).account;

        account = Account(v.name, v.email, v.phone);
      } else {
        emit(GlobalLoginError());
      }

      emit(GlobalLoginSuccess());
    }).catchError((e, s) {
      emit(GlobalLoginError());
    });
  }

  void register(
      {required String name,
      required String email,
      required String password,
      required String phone}) {
    emit(GlobalRegisterLoading());
    DioHelper.postData(url: REGISTER, body: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone
    }).then((value) {
      print(value.data['message']);
      if (value.data['status'] == 200) {
        emit(GlobalRegisterSuccess(value.data['message']));
      } else {
        emit(GlobalRegisterError(value.data['message']));
      }
    }).catchError((e, s) {
      emit(GlobalRegisterError(''));
    });
  }
}
