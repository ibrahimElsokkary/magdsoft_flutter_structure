import 'package:flutter/material.dart';

import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/components.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
        centerTitle: true,
        
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text('Name : ${GlobalCubit.get(context).account?.name}'),
            Text('Email : ${GlobalCubit.get(context).account?.email}'),
            Text('phone : ${GlobalCubit.get(context).account?.phone}'),
            ],),
            
            defaultButton(text: 'Log out', onPressed: (){
              Navigator.pushNamed(context, '/login');
            }, color: AppColor.red)
        ]),
      ),
    );
  }
}