import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8080/Shared/cashehelber.dart';
import 'package:flutter_application_8080/Shared/companents.dart';
import 'package:flutter_application_8080/screen/login.dart';


import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoarderModel {
  String image;
  String title;
  String body;
  BoarderModel({
    required this.image,
    required this.body,
    required this.title,
  });
}

class bording extends StatefulWidget {
  @override
  State<bording> createState() => _bordingState();
}

class _bordingState extends State<bording> {
  var page_Controller = PageController();

  List<BoarderModel> Border = [
    BoarderModel(image: 'as/images/page1.png', body: "body1", title: "title1"),
    BoarderModel(image: 'as/images/page2.png', body: "body2", title: "title2"),
  ];

  bool islast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
          TextButton(
            onPressed: () {
              casheHelber.setDataShared(key: "bording",value: true);
              print("object");
                Nav(context, loginscreen());
            },
            child: const Text('SKIP',style: TextStyle(fontSize: 18,backgroundColor: Colors.blue,color: Colors.white)),
          ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: PageView.builder(
                itemBuilder: (con, ind) => bordWidge(Border[ind]),
                itemCount: Border.length,
                controller: page_Controller,
                onPageChanged: (ind) {
                 if(ind==Border.length-1){
                   print("last");
                   setState(() {
                     islast=true;
                   });
                 }
                 else{

                   print("object");
                   setState(() {
                     islast=false;
                   });
                 }
                 
                },
              )),
              Row(
                children: [
                  // ignore: prefer_const_constructors
                  SmoothPageIndicator(
                    controller: page_Controller,
                    count: Border.length,
                    // ignore: prefer_const_constructors
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.blue,
                        dotHeight: 16.0,
                        expansionFactor: 10,
                        spacing: 5,
                        activeDotColor: Colors.black),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if(islast){
                        casheHelber.setDataShared(key: "bording",value: true);
                        Nav(context, loginscreen());
                      }
                      else{
                      page_Controller.nextPage(
                          duration: (
                              // ignore: prefer_const_constructors
                              Duration(
                            milliseconds: 170,
                          )),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }},
                    child: Icon(Icons.forward_rounded),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

Widget bordWidge(BoarderModel model) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage("${model.image}"))),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 10,
        ),
        Text(
          "${model.title}",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Text(
          "${model.body}",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    );




