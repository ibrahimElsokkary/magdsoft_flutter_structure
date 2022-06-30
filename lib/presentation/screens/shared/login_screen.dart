import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/register_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/components.dart';

import '../../styles/colors.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = GlobalCubit.get(context);
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is GlobalLoginSuccess) {
          Navigator.pushReplacementNamed(context, '/user');
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.praimary,
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.longestSide,
                  child: Column(children: [
                    //top section
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          //switch language button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cubit.changeLocale();
                                    },
                                    child: Text(cubit.en?'عربي':'English',
                                        style: TextStyle(
                                            color: AppColor.praimary)),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                          // logo image
                          Expanded(child: Image.asset('assets/images/logo.png'))
                        ],
                      ),
                    )),
                    //bottom section
                    Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(children: [
                              SizedBox(
                                height: 80,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: defaultFormField(context,
                                    controller: _email,
                                    type: TextInputType.emailAddress,
                                    lable: 'Email', validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter A Valid Email';
                                  }
                                }),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: defaultFormField(context,
                                    controller: _password,
                                    type: TextInputType.text,
                                    lable: 'Password', validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter A Password';
                                  }
                                },
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        cubit.changePasswordVisabilty();
                                      },
                                      icon: Icon(cubit.passwordVisabilty
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined),
                                    ),
                                    isPassword: cubit.passwordVisabilty),
                              ),
                              Spacer(),
                              // Buttons groub
                              Row(
                                children: [
                                  Expanded(
                                      child: defaultButton(
                                          text: 'Login',
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              print(_password.value.text);
                                              cubit.login(LoginRequest(
                                                  email: _email.value.text,
                                                  password:
                                                      _password.value.text));

                                              print(state);
                                            }
                                          })),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Expanded(
                                      child: defaultButton(
                                          text: 'Registre', onPressed: () {
                                            Navigator.pushNamed(context, '/register');
                                          })),
                                ],
                              ),
                              SizedBox(
                                height: 80,
                              ),
                            ]),
                          ),
                        )),
                  ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
