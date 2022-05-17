import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/models/usermodel.dart';
import 'package:flutter_application_8080/socialcubit/register/registerstates.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class registercubit extends Cubit<social_register_States> {
  registercubit() : super(social_Initial_register_state());
  static registercubit get(context) => BlocProvider.of(context);

  IconData password = Icons.remove_red_eye_sharp;
  bool ispassword = true;
  void changePasswordIcon() {
    ispassword = !ispassword;
    password =
        ispassword ? Icons.remove_red_eye_sharp : Icons.remove_red_eye_outlined;
    emit(changePasswordRe());
  }

  void userregister({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(social_register_loding_state());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print("siu tamam ");
      print(value.user!.email.toString());
      // emit(social_register_succ_state());
      print("sIUUUUUUUDashdahsudhasuhduhuhasduhauhsdasjhkdjas");
      print(value.user!.uid);
      usercreate(email: email, phone: phone, name: name, uId: value.user!.uid);
    }).catchError((onError) {
      print("siu eroor");
      emit(social_register_eroor_state());
    });
  }

  void usercreate({
    required String email,
    required String phone,
    required String name,
    required String uId,
  }) {
    usermodel model = usermodel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        isemailv: false,
        bio: "This Is My Bio",
        image:
            "https://img.freepik.com/free-photo/photo-stupefied-caucasian-male-with-dark-stubble-keeps-mouth-widely-opened-points-upwards-with-fore-finger-dressed-fashionable-clothes-indicates-blank-space-upwards-against-pink-wall_273609-15888.jpg?w=740",
        cover:
            "https://img.freepik.com/free-photo/photo-amazed-young-european-man-keeps-hands-mouth-stares-shocked-camera-reacts-unexpected-relevation_273609-45892.jpg?w=996");
    emit(social_createUser_loding_state());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.TOMap())
        .then((value) {
      emit(social_createUser_succ_state(uId: uId));
    }).catchError((onError) {
      print(onError.toString());
      emit(social_createUser_eroor_state(onError.toString()));
      print(onError.toString());
    });
  }
}
