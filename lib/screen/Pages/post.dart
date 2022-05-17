import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Shared/brocker.dart';
import 'package:flutter_application_8080/Shared/companents.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailStates.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Post extends StatelessWidget {

var postcontrol=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socailCubit,socailHomeStates>(builder: (BuildContext context, state) { return Scaffold(
      appBar: AppBar( 
        actions: [
          TextButton(onPressed: (){
            var now = DateTime.now();
            if(socailCubit.get(context).postimage==null){
             socailCubit.get(context). createpost(datatime: now.toString(), text: postcontrol.text,);
            }
            else{
 socailCubit.get(context).uploadpostimage(datatime:  now.toString(), text: postcontrol.text);
            }
          }, child: Text("Post ",style: TextStyle(color: Colors.white),))
        ],
        leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(IconBroken.Arrow___Left_2)),
      title: Text("Post"),
      ),
      
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [ 
            if(state is createPostloading)
            LinearProgressIndicator(),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                            "https://img.freepik.com/free-photo/emotional-bearded-male-has-surprised-facial-expression-astonished-look-dressed-white-shirt-with-red-braces-points-with-index-finger-upper-right-corner_273609-16001.jpg?w=826",
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Mohamed Fouad",
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        height: 1.5,
                                        color: Colors.black),
                                  ),
                                  ],
                              ),
                           
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                    child: TextFormField(
                      controller: postcontrol,
                      decoration: InputDecoration(
                      hintText: "what is on Your Mind ",
                      border:  InputBorder.none
                    ),),
                  ),
                if(socailCubit.get(context).postimage!=null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children:  [
                    Image(
                      fit: BoxFit.cover,
                      height: 140,
                      width: double.infinity,
                      image: FileImage(socailCubit.get(context).postimage),
                      
                    ),
                  CircleAvatar(
                   radius: 15,
                    child: IconButton(onPressed: (){
                      socailCubit.get(context).removepostimage();
                    }, icon: Icon(Icons.close),color: Colors.white,iconSize: 14,)), 
                   
                  ],
                ),
                 SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Expanded(
                         child: TextButton(
                           
                           onPressed: () { socailCubit.get(context).getpostimage();  },
                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                         
                                              children: [
                           Icon(Icons.add_a_photo),
                                              SizedBox(width: 5,),
                           Text("Add Photo")
                           
                                              ],
                                            ),
                         ),
                       ) ,
                    Expanded(
                         child: TextButton(
                           
                           onPressed: () { 
                            
                            },
                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                         
                                              children: [
                           
                                              SizedBox(width: 5,),
                           Text("#Tages")
                           
                                              ],
                                            ),
                         ),
                       ) ,],
                  ),
          ],
        ),
      ),
    ); }, listener: (BuildContext context, Object? state) {  },);
  }
}