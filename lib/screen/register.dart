import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Shared/cashehelber.dart';
import 'package:flutter_application_8080/Shared/companents.dart';
import 'package:flutter_application_8080/screen/home.dart';
import 'package:flutter_application_8080/screen/login.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailcubit.dart';
import 'package:flutter_application_8080/socialcubit/register/registerstates.dart';
import 'package:flutter_application_8080/socialcubit/register/socailregistercubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class register extends StatelessWidget {
  var usercontrol = TextEditingController();
  var emailcontrol = TextEditingController();

  var passwordcontrol = TextEditingController();
  var regkey = GlobalKey<FormState>();

  var phonecontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => registercubit(),
      child: BlocConsumer<registercubit, social_register_States>(
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 2,
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: regkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "REGISTER",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextForm(
                            Con: usercontrol,
                            lable: "Name",
                            prefixIcon: Icon(Icons.account_box_outlined),
                            val: "Please enter name Again !"),
                        SizedBox(
                          height: 20,
                        ),
                        TextForm(
                            Con: emailcontrol,
                            lable: "email",
                            prefixIcon: Icon(Icons.person),
                            val: "Please enter user Again !"),
                        SizedBox(
                          height: 20,
                        ),
                        TextForm(
                            Con: passwordcontrol,
                            lable: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon:
                                Icon(registercubit.get(context).password),
                            val: "Please enter Password Again !",
                            type: TextInputType.visiblePassword,
                            obscureText: registercubit.get(context).ispassword,
                            fun_su: () {
                              registercubit.get(context).changePasswordIcon();
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextForm(
                            Con: phonecontrol,
                            lable: "phone",
                            prefixIcon: Icon(Icons.phone),
                            val: "Please enter phone Again !"),
                        SizedBox(
                          height: 25,
                        ),
                        state is! social_register_loding_state
                            ? Container(
                                width: double.infinity,
                                color: Colors.black,
                                child: TextButton(
                                    onPressed: () {
                                      if (regkey.currentState!.validate()) {
                                        registercubit.get(context).userregister(
                                            email: emailcontrol.text,
                                            password: passwordcontrol.text,
                                            phone: phonecontrol.text,
                                            name: usercontrol.text);
                                      }
                                    },
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    )),
                              )
                            : Container(
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Do you have an acount?",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            TextButton(
                                onPressed: () {
                                  Nav(context, loginscreen());
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 19),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {
          if (state is social_createUser_succ_state) {
            print("Log in Is Done Ya Fager");

            casheHelber
                .setDataShared(key: "uId", value: state.uId)
                .then((value) {
              Nav(context, home());
            }).catchError((onError) {
              print(onError.toString());
            });
          }
        },
      ),
    );
  }
}
