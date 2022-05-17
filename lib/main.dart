import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Bording/bording.dart';
import 'package:flutter_application_8080/Shared/blocobser.dart';
import 'package:flutter_application_8080/Shared/cashehelber.dart';
import 'package:flutter_application_8080/Shared/diohelper.dart';
import 'package:flutter_application_8080/Shared/endpoint.dart';
import 'package:flutter_application_8080/screen/home.dart';
import 'package:flutter_application_8080/screen/login.dart';
import 'package:flutter_application_8080/screen/register.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailStates.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailcubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await casheHelber.init();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await dioHelber.init();
  Widget w;
  bool onbording = casheHelber.getDataShared(key: "bording") ?? false;

  print(onbording);
  var h = casheHelber.getDataShared(key: "uId") ?? '';
  UID = h;
  print(h);
  if (onbording) {
    if (h != '') {
      w = home();
      print("h");
    } else {
      w = loginscreen();
      print("L");
    }
  } else {
    w = bording();
    print("B");
  }

  runApp(MyApp(
    w: w,
  ));
}

class MyApp extends StatelessWidget {
  var w;
  MyApp({@required this.w});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return socailCubit()
              ..getUserData()
              ..getPosts();
          },
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: bording(),
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: "Foush",
          )),
    );
  }
}
