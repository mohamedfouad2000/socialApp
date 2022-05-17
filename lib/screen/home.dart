import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Shared/brocker.dart';
import 'package:flutter_application_8080/Shared/companents.dart';
import 'package:flutter_application_8080/screen/Pages/post.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailStates.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailcubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socailCubit,socailHomeStates>(
      builder: (BuildContext context, state) {return  Scaffold(
      appBar:  AppBar(title: Text(socailCubit.get(context).titles[socailCubit.get(context).currentIndex]),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification)),
        IconButton(onPressed: (){}, icon: Icon(IconBroken.Search)),
      ],
      
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white ,
        fixedColor: Colors.lightBlueAccent,
        currentIndex:socailCubit.get(context).currentIndex ,
        items: [
         BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: "Feeds"),
         BottomNavigationBarItem(icon: Icon(IconBroken.Chat),label: "Chats"),
         BottomNavigationBarItem(icon: Icon(IconBroken.Paper_Upload),label: "Post"),
         BottomNavigationBarItem(icon: Icon(IconBroken.Location),label: "Users"),
         BottomNavigationBarItem(icon: Icon(IconBroken.Setting),label: "Settings"),

        ],
        onTap: (index){
          socailCubit.get(context).changeIcon(index);
        },
        ),
      body: socailCubit.get(context).Screens[socailCubit.get(context).currentIndex] ,
    );  },
     listener: (BuildContext context, Object? state) {
       if(state is Post_state){
         NavegatorPush(context, Post());
       }
       },);
    
    }}