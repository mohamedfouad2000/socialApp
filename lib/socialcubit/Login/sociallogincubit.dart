import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/socialcubit/Login/loginstates.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class socialLogincubit extends Cubit<social_Login_States> {
  socialLogincubit() : super(social_Initial_state());
  static socialLogincubit get(context) => BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(social_Login_loding_state());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          print("Log in Tamam");
       emit(social_Login_success_state(value.user!.uid));

        })
        .catchError((onError) {
          print("Error Man In Log iN ");

           emit(social_Login_Error_state(onError.toString()));

        });
  }

  IconData password = Icons.remove_red_eye_sharp;
  bool ispassword = true;
  void changePasswordIcon() {
    ispassword = !ispassword;
    password =
        ispassword ? Icons.remove_red_eye_sharp : Icons.remove_red_eye_outlined;
    emit(changePassword());
  }
}
