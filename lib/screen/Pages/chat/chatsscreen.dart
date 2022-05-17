import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Shared/brocker.dart';
import 'package:flutter_application_8080/models/chatmodel.dart';
import 'package:flutter_application_8080/models/usermodel.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailStates.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class chatsscreen extends StatelessWidget {
  usermodel model;
  var masscont = TextEditingController();

  chatsscreen({required this.model});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        socailCubit.get(context).getmassages(reciveruid: model.uId);
        return BlocConsumer<socailCubit, socailHomeStates>(
          builder: (BuildContext context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        "${model.image}",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${model.name} ",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              body: socailCubit.get(context).masseage.length > 0
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                var m = socailCubit
                                    .get(context)
                                    .masseage[index]
                                    .senderuid;
                                if (socailCubit.get(context).model!.uId == m) {
                                  return sendchat(
                                      socailCubit.get(context).masseage[index]);
                                } else {
                                  return reciverchat(
                                      socailCubit.get(context).masseage[index]);
                                }
                              },
                              itemCount:
                                  socailCubit.get(context).masseage.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 15,
                                );
                              },
                            ),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(.5),
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: masscont,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type Your Massage "),
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 1,
                                  height: 45.0,
                                  color: Colors.blue,
                                  onPressed: () {
                                    socailCubit.get(context).sendmassages(
                                        text: masscont.text,
                                        datatime: DateTime.now().toString(),
                                        reciveruid: model.uId);
                                  },
                                  child: Icon(
                                    IconBroken.Send,
                                    size: 16.0,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            );
          },
          listener: (BuildContext context, Object? state) {},
        );
      },
    );
  }
}

Widget sendchat(chatmodel model) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
            )),
        child: Text(model.text),
      ),
    );

Widget reciverchat(var model) => Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.2),
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
            )),
        child: Text(model.text),
      ),
    );
