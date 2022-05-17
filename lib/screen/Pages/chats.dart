import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Shared/companents.dart';
import 'package:flutter_application_8080/models/usermodel.dart';
import 'package:flutter_application_8080/screen/Pages/chat/chatsscreen.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailStates.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chats extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socailCubit,socailHomeStates>(
      builder: (BuildContext context, state) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {  return chat(socailCubit.get(context).users[index],context) ;},
     itemCount:socailCubit.get(context).users.length , separatorBuilder: (BuildContext context, int index) {return Container(width: double.infinity,height: 1,color: Colors.grey,);},);  },
     listener: (BuildContext context, Object? state) {  },);
  }
}

Widget chat(usermodel model,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child:   InkWell(
    onTap: (){
    NavegatorPush(context, chatsscreen(model:model ,));
    },
    child: Row(
    
                          children: [
    
                            CircleAvatar(
    
                              radius: 25.0,
    
                              backgroundImage: NetworkImage(
    
                                "${model.image}",
    
                              ),
    
                            ),
    
                            SizedBox(
    
                              width: 20,
    
                            ),
    
                            Expanded(
    
                              child: Text(
    
                                                           "${model.name}",
    
    
    
                                style: TextStyle(
    
                                    fontSize: 22.0,
    
                                    height: 1.5,
    
                                    color: Colors.black),
    
                              ),
    
                            ),
    
                          ],
    
                        ),
  ),
);