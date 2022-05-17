import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Shared/cashehelber.dart';
import 'package:flutter_application_8080/Shared/companents.dart';
import 'package:flutter_application_8080/screen/Pages/profileedit.dart';
import 'package:flutter_application_8080/screen/login.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailStates.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeTTings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<socailCubit, socailHomeStates>(
     
      builder: (BuildContext context, state) {
         var model=socailCubit.get(context).model;
         
        return Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 170,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children:  [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Image(
                        fit: BoxFit.cover,
                        height: 140,
                        width: double.infinity,
                        image: NetworkImage("${model?.cover}"),
                        
                      ),
                    ),
                   
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                     
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(
                            "${model?.image}"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Text(
                "${model?.name}",
                style:
                    TextStyle(fontSize: 22.0, height: 1.5, color: Colors.black),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                "${model?.bio}",
                style: TextStyle(
                    fontSize: 16.0, color: Colors.black26, height: 1.5),
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                         
                          Text(
                            "100 ",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                height: 1.5),
                          ),
                          // ignore: prefer_const_constructors
                          Text(
                            "Post ",
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            "64 ",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                height: 1.5),
                          ),
                          // ignore: prefer_const_constructors
                          Text(
                            "Photos ",
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            "12k ",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                height: 1.5),
                          ),
                          // ignore: prefer_const_constructors
                          Text(
                            "followers ",
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            "50 ",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                height: 1.5),
                          ),
                          // ignore: prefer_const_constructors
                          Text(
                            "following ",
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: (){}, child: Text("Add Photo",style: TextStyle(fontSize: 18),))),
                SizedBox(width: 5,),
                OutlinedButton(onPressed: (){
                  NavegatorPush(context, profileedit());
                }, child: Icon(Icons.edit) ),
              ],
            ),
          TextButton(onPressed: (){
            casheHelber.removeData(key: "uId").then((value) {
                 Nav(context, loginscreen());
               });
          }, child: Text("Sign out")),

            ],
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}


