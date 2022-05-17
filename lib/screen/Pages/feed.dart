import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Shared/brocker.dart';
import 'package:flutter_application_8080/models/postmodel.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailStates.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class feeds extends StatelessWidget {
 var commentcont =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socailCubit,socailHomeStates>(builder: (BuildContext context, state) { return 
     
  socailCubit.get(context).posts!=null&&socailCubit.get(context).model!=null
   ? SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsets.all(8.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/emotional-bearded-male-has-surprised-facial-expression-astonished-look-dressed-white-shirt-with-red-braces-points-with-index-finger-upper-right-corner_273609-16001.jpg?w=826',
                  ),
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
                Text("Connect with your friends"),
              ],
            ),
          ),
        ListView.separated(
          itemBuilder: (BuildContext context, int index) {
              return  socailCubit.get(context).posts.length>0 &&socailCubit.get(context).model!=null
             ?PostC(index: index, model: socailCubit.get(context).posts[index],context:context,commentcont:commentcont):Center(child: CircularProgressIndicator()) ; },
          itemCount: socailCubit.get(context).posts.length,shrinkWrap: true, physics: BouncingScrollPhysics(), 
          separatorBuilder: (BuildContext context, int index) {return Container(
          height: 20,
        );  }, )
        ],
      ),
    )
   :Center(child: CircularProgressIndicator())
    ;
      },
     listener: (BuildContext context, Object? state) {  },);
    }
}


Widget PostC({ required Postmodel model,context,index,commentcont})=>  Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            elevation: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                          "${model.image}",
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
                                  "${model.name}",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      height: 1.5,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                  size: 17,
                                )
                              ],
                            ),
                            Text(
                              "${model.datatime}",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black26,
                                  height: 1.5),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey[50],
                  ),
                  Text(
                    "${model.text}",
                    style: TextStyle(height: 1.5, color: Colors.black),
                  ),
              // Container(
              //   width: double.infinity,
              //   child: Wrap(
                  
              //     children: [
                   
              //        Padding(
              //         padding: const EdgeInsetsDirectional.only(
              //           end: 4,
              //         ),
              //         child: Container(
              //           height: 20,
              //           child: MaterialButton(minWidth: 1,padding: EdgeInsets.zero,onPressed: (){},child: Text("#SIuuuuu",style: TextStyle(color: Colors.blue,height: 1),)),
                        
              //         ),
              //       ),
              //        Padding(
              //         padding: const EdgeInsetsDirectional.only(
              //           end: 4,
              //         ),
              //         child: Container(
              //           height: 20,
              //           child: MaterialButton(minWidth: 1,padding: EdgeInsets.zero,onPressed: (){},child: Text("#SIuuuuu",style: TextStyle(color: Colors.blue,height: 1),)),
                        
              //         ),
              //       ),
              //        Padding(
              //         padding: const EdgeInsetsDirectional.only(
              //           end: 4,
              //         ),
              //         child: Container(
              //           height: 20,
              //           child: MaterialButton(minWidth: 1,padding: EdgeInsets.zero,onPressed: (){},child: Text("#SIuuuuu",style: TextStyle(color: Colors.blue,height: 1),)),
                        
              //         ),
              //       ),
              //        Padding(
              //         padding: const EdgeInsetsDirectional.only(
              //           end: 4,
              //         ),
              //         child: Container(
              //           height: 20,
              //           child: MaterialButton(minWidth: 1,padding: EdgeInsets.zero,onPressed: (){},child: Text("#SIuuuuu",style: TextStyle(color: Colors.blue,height: 1),)),
                        
              //         ),
              //       ),
              //        Padding(
              //         padding: const EdgeInsetsDirectional.only(
              //           end: 4,
              //         ),
              //         child: Container(
              //           height: 20,
              //           child: MaterialButton(minWidth: 1,padding: EdgeInsets.zero,onPressed: (){},child: Text("#SIuuuuu",style: TextStyle(color: Colors.blue,height: 1),)),
                        
              //         ),
              //       ),
              //        Padding(
              //         padding: const EdgeInsetsDirectional.only(
              //           end: 4,
              //         ),
              //         child: Container(
              //           height: 20,
              //           child: MaterialButton(minWidth: 1,padding: EdgeInsets.zero,onPressed: (){},child: Text("#SIuuuuu",style: TextStyle(color: Colors.blue,height: 1),)),
                        
              //         ),
              //       ),
              //     ],
              //   ),
              // ),  
              SizedBox(
                height: 10,
              ),
              if(socailCubit.get(context).postimage!="")
              Container(
                height: 120,
                width: double.infinity,
                
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0),image:DecorationImage(image: NetworkImage(
                          "${model.postimage}",
                        ),fit: BoxFit.cover) ),
                
              ),
               Row(
                 children: [
                   Expanded(
                     child: InkWell(
                       onTap: (){},
                       child: Row(
                         children: [
                           Icon(IconBroken.Heart,size: 20,color: Colors.red),
                           SizedBox(width: 4,),
                           Text('${socailCubit.get(context).l[index]}'),
                         ],
                       ),
                     ),
                   ),
                Expanded(
                     child: InkWell(
                       onTap: (){},
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Icon(IconBroken.Chat,size: 20,color: Colors.amber,),
                           SizedBox(width: 4,),
                           Text('${socailCubit.get(context).c[index]}'),
                         ],
                       ),
                     ),
                   ),
                 
                 ],
               ), 
               Container(
                    height: 3,
                    width: double.infinity,
                    color: Colors.grey[90],
                  ),
                  SizedBox(width: 15,),
               Row(
                 children: [
                   
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CircleAvatar(
                                radius: 18.0,
                                backgroundImage: NetworkImage(
                                  "${socailCubit.get(context).model!.image}",
                                ),
                              ),
                          ),
                            SizedBox(width: 10,),
                             Expanded(
                    child: TextFormField(
                      controller: commentcont,
                      decoration: InputDecoration(
                      hintText: "wirte the comment ",
                      border:  InputBorder.none
                    ),),
                  ),
                      TextButton(onPressed: (){
                        socailCubit.get(context).getuserscomment(postid: socailCubit.get(context).postid[index], comment: commentcont.text);
                      }, child: Text("comment"))
                        ],
                      ),
                    ),
                  InkWell(
                    onTap: (){
                      socailCubit.get(context).getuserslikes( socailCubit.get(context).postid[index]);
                    },
                       child: Row(
                         children: [
                           Icon(IconBroken.Heart,size: 20,color: Colors.red),
                           Text("Like"),
                         ],
                       ),
                     ),
                 ],
               )],
            
              ),
            ),
          );