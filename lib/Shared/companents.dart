import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_8080/Shared/brocker.dart';
import 'package:fluttertoast/fluttertoast.dart';

NavegatorPush(context, page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (builder) => page),
  );
}

Nav(context, page) {
  return Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (builder) => page), (route) => false);
}

Widget TextForm({
  // ignore: non_constant_identifier_names
  @required var Con,
  var type = TextInputType.text,
  @required var lable,
  @required var prefixIcon,
  @required var val,
  var obscureText = false,
  var suffixIcon,
  var fun_su,
  var ontap,
  var onchange,
  var onsubmit,
}) =>
    TextFormField(
      onFieldSubmitted: onsubmit,
      onTap: ontap,
      controller: Con,
      onChanged: onchange,
      keyboardType: type,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: lable,
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: fun_su, icon: suffixIcon)
            : null,
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return val;
        } else {
          return null;
        }
      },
    );

enum toaststate { error, success, warning }

Color ToastSort(toaststate state) {
  Color color;
  switch (state) {
    case toaststate.success:
      color = Colors.green;
      break;
    case toaststate.error:
      color = Colors.red;
      break;
    case toaststate.warning:
      color = Colors.yellow;
      break;
  }
  return color;
}

void ShowToastFun({required String msg, required toaststate Sort}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ToastSort(Sort),
        textColor: Colors.white,
        fontSize: 16.0);
Widget defalutAppbar({required var context, var title,var Action}) =>
    AppBar(
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(IconBroken.Arrow___Left_2)),
      title: Text("${title}"),
      actions: Action,
      );
