import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftoast/ftoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/components.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(listener: (context, state) {
      if (state is GlobalRegisterError)
        FToast.toast(context, msg: state.message);

      if (state is GlobalRegisterSuccess)
        FToast.toast(context, msg: state.message);
        
    }, builder: (context, state) {
      var cubit = GlobalCubit.get(context);
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
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: IntrinsicHeight(
                              child: Column(children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: defaultFormField(context,
                                      controller: _name,
                                      type: TextInputType.name,
                                      lable: 'Full Name', validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter A Valid Name';
                                    }
                                  }),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: defaultFormField(context,
                                      controller: _phone,
                                      type: TextInputType.phone,
                                      lable: 'Phone', validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter A Valid Phone Number ';
                                    }
                                  }),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: defaultFormField(context,
                                      controller: _password,
                                      type: TextInputType.text,
                                      lable: 'Password',
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          cubit.changePasswordVisabilty();
                                        },
                                        icon: Icon(cubit.passwordVisabilty
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined),
                                      ),
                                      isPassword: cubit.passwordVisabilty,
                                      validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter A Valid Password';
                                    }
                                  }),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: defaultFormField(context,
                                      controller: _confirm,
                                      type: TextInputType.text,
                                      lable: 'Confirm Password',
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          cubit.changePasswordVisabilty();
                                        },
                                        icon: Icon(cubit.passwordVisabilty
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined),
                                      ),
                                      isPassword: cubit.passwordVisabilty,
                                      validator: (value) {
                                    if (value != _password.text) {
                                      return 'Password does not match ';
                                    }
                                  }),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Buttons groub
                                Row(
                                  children: [
                                    Expanded(
                                        child: defaultButton(
                                            text: 'Login',
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/login');
                                            })),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Expanded(
                                        child: defaultButton(
                                            text: 'Registre',
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                cubit.register(
                                                    name: _name.text,
                                                    email: _email.text,
                                                    password: _password.text,
                                                    phone: _phone.text);

                                                if (state
                                                    is GlobalRegisterSuccess) {
                                                  Navigator.pushNamed(
                                                      context, '/login');
                                                }
                                              }
                                            })),
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        ),
                      )),
                ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
