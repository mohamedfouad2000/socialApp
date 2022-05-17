import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Shared/brocker.dart';
import 'package:flutter_application_8080/Shared/companents.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailStates.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class profileedit extends StatelessWidget {
  var namecon = TextEditingController();
  var biocon = TextEditingController();
  var phonecon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socailCubit, socailHomeStates>(
      builder: (BuildContext context, state) {
        var model = socailCubit.get(context).model;
        var prof = socailCubit.get(context).profileimage;
        var cover = socailCubit.get(context).coverimage;

        namecon.text = model!.name;
        biocon.text = model.bio;
        phonecon.text = model.phone;

        ImageProvider profilefun() {
          if (prof == null) {
            return NetworkImage("${model.image}");
          } else {
            return FileImage(prof);
          }
        }

        ImageProvider coverfun() {
          if (cover == null) {
            return NetworkImage("${model.cover}");
          } else {
            return FileImage(cover);
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Profile Edit"),
            titleSpacing: 0.0,
            actions: [
              TextButton(
                  onPressed: () {
                    socailCubit.get(context).updateuser(
                          bio: biocon.text,
                          name: namecon.text,
                          phone: phonecon.text,
                        );
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  if (state is updateuserdataloading) LinearProgressIndicator(),
                  Container(
                    height: 170,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Image(
                                fit: BoxFit.cover,
                                height: 140,
                                width: double.infinity,
                                image: coverfun(),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  socailCubit.get(context).getcoverphoto();
                                },
                                icon: CircleAvatar(
                                  radius: 15,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 14,
                                  ),
                                ))
                          ],
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 55,
                                backgroundImage: profilefun(),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  socailCubit.get(context).getprofilephoto();
                                },
                                icon: CircleAvatar(
                                  radius: 15,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 14,
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (socailCubit.get(context).profileimage != null ||
                      socailCubit.get(context).coverimage != null)
                    Row(
                      children: [
                        if (socailCubit.get(context).profileimage != null)
                          Expanded(
                              child: Column(
                            children: [
                              Container(
                                  width: double.infinity,
                                  color: Colors.blue,
                                  child: TextButton(
                                    onPressed: () {
                                      socailCubit.get(context).updateProfileImage(name: namecon.text, phone: phonecon.text, bio: biocon.text,);
                                    },
                                    child: Text(
                                      "Update Profile Image",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              if(state is updateuserprofileloading)
                              LinearProgressIndicator(),
                            ],
                          )),
                        SizedBox(
                          width: 10,
                        ),
                        if (socailCubit.get(context).coverimage != null)
                          Expanded(
                              child: Column(
                            children: [
                              Container(
                                  width: double.infinity,
                                  color: Colors.blue,
                                  child: TextButton(
                                    onPressed: () {
                                      socailCubit.get(context).updatecoverImage(name: namecon.text, phone: phonecon.text, bio: biocon.text,);
                                    },
                                    child: Text(
                                      "Update cover  Image",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              if(state is updateusercoverloading)
                              LinearProgressIndicator(),
                            ],
                          )),
                      ],
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  TextForm(
                      Con: namecon,
                      lable: "Name",
                      prefixIcon: Icon(IconBroken.User),
                      val: "Please Enter Your Email"),
                  SizedBox(
                    height: 15,
                  ),
                  TextForm(
                      Con: biocon,
                      lable: "Bio",
                      prefixIcon: Icon(IconBroken.Info_Circle),
                      val: "Please Enter Your bioc"),
                  SizedBox(
                    height: 15,
                  ),
                  TextForm(
                      Con: phonecon,
                      lable: "Phone",
                      prefixIcon: Icon(IconBroken.Call_Missed),
                      val: "Please Enter Your Phone"),
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
