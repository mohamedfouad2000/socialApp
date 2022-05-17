import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Shared/cashehelber.dart';
import 'package:flutter_application_8080/Shared/companents.dart';
import 'package:flutter_application_8080/screen/home.dart';
import 'package:flutter_application_8080/screen/register.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailcubit.dart';
import 'package:flutter_application_8080/socialcubit/Login/loginstates.dart';
import 'package:flutter_application_8080/socialcubit/Login/sociallogincubit.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

class loginscreen extends StatelessWidget {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) {
          return socialLogincubit();
        },
        child: BlocConsumer<socialLogincubit, social_Login_States>(
          builder: (BuildContext context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 1.0,
              ),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Login Now To Browes Our Hot Offers",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextForm(
                            Con: userController,
                            lable: "User Name",
                            prefixIcon: Icon(Icons.person),
                            val: "Please enter User Again !"),
                        SizedBox(
                          height: 20,
                        ),
                        TextForm(
                            Con: passwordController,
                            lable: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon:
                                Icon(socialLogincubit.get(context).password),
                            val: "Please enter Password Again !",
                            type: TextInputType.visiblePassword,
                            obscureText:
                                socialLogincubit.get(context).ispassword,
                            fun_su: () {
                              socialLogincubit
                                  .get(context)
                                  .changePasswordIcon();
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        state is! social_Login_loding_state
                            ? Container(
                                width: double.infinity,
                                color: Colors.black,
                                child: TextButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                     socialLogincubit.get(context).userLogin(email: userController.text, password: passwordController.text);
                                    }
                                  },
                                  child: Text("LogIn",
                                      style: TextStyle(color: Colors.grey)),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an acount?",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            TextButton(
                                onPressed: () {
                                  Nav(context, register());
                                },
                                child: Text(
                                  "Register",
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
            );
          },
          listener: (BuildContext context, Object? state) {
            if (state is social_Login_Error_state) {
              ShowToastFun(
                  msg: "${state.error}", Sort: toaststate.error);
            }
             if (state is social_Login_success_state){
               casheHelber.setDataShared(key: "uId", value: state.uId).then((value) {
                 Nav(context, home());
                 socailCubit()..getUserData()..getPosts();
               });
             }
          },
        ));
  }
}
