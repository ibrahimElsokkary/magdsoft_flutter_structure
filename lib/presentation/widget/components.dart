import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';


Widget defaultFormField(
  context, {
  required TextEditingController controller,
  hint = '',
  lable = '',
  required TextInputType type,
  Function? onType,
  isPassword = false,
  Icon? prefixcIcon,
  IconButton? suffixIcon,
  Function(dynamic value)? onFaildSubmitted,
  VoidCallback? onTap,
  Function(String)? onChanged,
  String? Function(String? val)? validator,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: TextFormField(
        validator: validator,
        onFieldSubmitted: onFaildSubmitted,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: lable,
          suffixIcon: suffixIcon,
          prefixIcon: prefixcIcon,
          hintText: hint,
        ),
      ),
    );

Widget defaultButton({required String text , required void Function()? onPressed,Color color = AppColor.praimary}) {
  return Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Text(text),
      ),
      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(color) ),
    ),
  );
}
