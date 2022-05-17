import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_8080/Shared/endpoint.dart';
import 'package:flutter_application_8080/models/chatmodel.dart';
import 'package:flutter_application_8080/models/postmodel.dart';
import 'package:flutter_application_8080/models/usermodel.dart';
import 'package:flutter_application_8080/screen/Pages/chats.dart';
import 'package:flutter_application_8080/screen/Pages/feed.dart';
import 'package:flutter_application_8080/screen/Pages/post.dart';
import 'package:flutter_application_8080/screen/Pages/settings.dart';
import 'package:flutter_application_8080/screen/Pages/users.dart';
import 'package:flutter_application_8080/socialcubit/Home/socailStates.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class socailCubit extends Cubit<socailHomeStates> {
  socailCubit() : super(socialInitialHomestate());
  static socailCubit get(context) => BlocProvider.of(context);

  usermodel? model;

  void getUserData() {
    emit(social_Home_loding_state());
    FirebaseFirestore.instance.collection("users").doc(UID).get().then((value) {
      // print(value.data());
      emit(social_Home_succ_state());
      model = usermodel.fromjson(value.data()!);
      print(model);
    }).catchError((onError) {
      emit(social_Home_eroor_state(onError.toString()));
    });
  }

// button nav
  int currentIndex = 1;
  void changeIcon(index) {
    if (index == 0) {
      getusersforchat();
    }
    if (index == 2) {
      emit(Post_state());
    } else {
      currentIndex = index;
      emit(Change_nav_index());
    }
  }

  List<Widget> Screens = [feeds(), Chats(), Post(), Users(), SeTTings()];
  List<String> titles = [
    "feeds",
    "Chats",
    "Siu",
    "Users",
    "SeTTings",
  ];

  ImagePicker picker = ImagePicker();
  var profileimage;
  Future<void> getprofilephoto() async {
    var pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      profileimage = File(pickedfile.path);
      print(pickedfile.path);
      emit(profileeditstatesucc());
    } else {
      print("No Image");
      emit(profileeditstateeroor());
    }
  }

  var coverimage;
  Future<void> getcoverphoto() async {
    var pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      coverimage = File(pickedfile.path);
      emit(covereditstatesucc());
    } else {
      print("No Image");
      emit(covereditstateeroor());
    }
  }

  void updateProfileImage({
    required var name,
    required var phone,
    required var bio,
  }) {
    emit(updateuserprofileloading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileimage!.path).pathSegments.last}')
        .putFile(profileimage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print("siu");
        updateuser(name: name, phone: phone, bio: bio, image: value);
        // emit(updateProfsucc());
      }).catchError((onError) {
        print(onError);
        emit(updateProferoor());
      }).catchError((onError) {
        print("eroor");
        emit(updateProferoor());
      });
    });
  }

  void updatecoverImage({
    required var name,
    required var phone,
    required var bio,
  }) {
    emit(updateusercoverloading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverimage!.path).pathSegments.last}')
        .putFile(coverimage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print("siu");
        updateuser(name: name, phone: phone, bio: bio, cover: value);
        // emit(updateCoversucc());
      }).catchError((onError) {
        emit(updateCovereroor());

        print(onError);
      }).catchError((onError) {
        print("eroor ");
        emit(updateCovereroor());
      });
    });
  }

  void updateuser({
    required var name,
    required var phone,
    required var bio,
    var image,
    var cover,
  }) {
    emit(updateuserdataloading());
    usermodel m = usermodel(
        name: name,
        phone: phone,
        bio: bio,
        image: image ?? model!.image,
        cover: cover ?? model!.cover,
        email: model!.email,
        isemailv: model!.isemailv,
        uId: model!.uId);
    FirebaseFirestore.instance
        .collection("users")
        .doc(m.uId)
        .update(m.TOMap())
        .then((value) {
      getUserData();
    }).catchError((onError) {
      print("eroor");
      emit(updateuserdataeroor());
    });
  }

  // var name;
  // var uId;
  // var image;
  // var datatime;
  // var text;
  // var postimage;

  var postimage;
  Future<void> getpostimage() async {
    var pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      postimage = File(pickedfile.path);
      print(pickedfile.path);
      emit(postimageesucc());
    } else {
      print("No Image");
      emit(postimageeeroor());
    }
  }

  void uploadpostimage({
    required var datatime,
    required var text,
  }) {
    emit(createPostloading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('post/${Uri.file(postimage!.path).pathSegments.last}')
        .putFile(postimage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createpost(datatime: datatime, text: text, postimage: value);
        print("siu");
      }).catchError((onError) {
        print(onError);
        emit(createPosteroor());
      }).catchError((onError) {
        print("eroor");
        emit(createPosteroor());
      });
    });
  }

  void createpost({
    required var datatime,
    required var text,
    var postimage,
  }) {
    emit(createPostloading());
    Postmodel postm = Postmodel(
        name: model!.name,
        datatime: datatime,
        text: text,
        uId: model!.uId,
        postimage: postimage ?? "",
        image: model!.image);
    FirebaseFirestore.instance
        .collection("post")
        .add(postm.TOMap())
        .then((value) {
      emit(createPostsucces());
    }).catchError((onError) {
      print("eroor");
      emit(createPosteroor());
    });
  }

  void removepostimage() {
    postimage = null;
    emit(removepostimagestate());
  }

  List<Postmodel> posts = [];
  List<String> postid = [];
  List<int> l = [];
  List<int> c = [];

  void getPosts() {
    emit(create_post_loding_state());
    FirebaseFirestore.instance.collection('post').get().then((value) {
      value.docs.forEach((element) {
        //هات اصله ب refernce
        element.reference.collection('likes').get().then((value) {
          l.add(value.docs.length);
          element.reference.collection('comment').get().then((value) {
            c.add(value.docs.length);
          }).catchError((onError) {
            print("eroor");
          });
          postid.add(element.id);
          posts.add(Postmodel.fromjson(element.data()));
        }).catchError((onError) {});
      });
      emit(create_post_succ_state());
    }).catchError((onError) {
      emit(create_post_eroor_state(onError.toString()));

      print(onError.toString());
    });
  }

  List<usermodel> users = [];
  void getusersforchat() {
    if (users.length == 0) {
      emit(create_user_chat_loding_state());
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          if (element.data()['uId'] != model!.uId)
            users.add(usermodel.fromjson(element.data()));
        });
        emit(create_user_chat_succ_state());
      }).catchError((onError) {
        emit(create_user_chat_eroor_state(onError.toString()));

        print(onError.toString());
      });
    }
  }

  List<usermodel> Likes = [];

  void getuserslikes(String postid) {
    FirebaseFirestore.instance
        .collection('post')
        .doc(postid)
        .collection("likes")
        .doc(model!.uId)
        .set({
      'like': true,
    }).then((value) {
      emit(create_like_succ_state());
    }).catchError((onError) {
      emit(create_like_eroor_state(onError.toString()));
    });
  }

  void getuserscomment({required String postid, required String comment}) {
    FirebaseFirestore.instance
        .collection('post')
        .doc(postid)
        .collection("comment")
        .doc(model!.uId)
        .set({
      'comment': comment,
    }).then((value) {
      emit(create_comment_succ_state());
    }).catchError((onError) {
      emit(create_comment_eroor_state(onError.toString()));
    });
  }

  void sendmassages({
    required String text,
    required String datatime,
    required String reciveruid,
  }) {
    emit(sendmassagesloading());

    chatmodel cmodel = chatmodel(
        datatime: datatime,
        text: text,
        reciveruid: reciveruid,
        senderuid: model!.uId);
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uId)
        .collection('chat')
        .doc(reciveruid)
        .collection("message")
        .add(cmodel.TOMap())
        .then((value) {
      emit(sendmassagessucces());
    }).catchError((onError) {
      emit(sendmassageseroor());
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(reciveruid)
        .collection('chat')
        .doc(model!.uId)
        .collection("message")
        .add(cmodel.TOMap())
        .then((value) {
      emit(sendmassagessucces());
    }).catchError((onError) {
      emit(sendmassageseroor());
    });
  }

  List<chatmodel> masseage = [];

  void getmassages({required String reciveruid}) {
    masseage = [];
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uId)
        .collection('chat')
        .doc(reciveruid)
        .collection("message")
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        masseage.add(chatmodel.fromjson(element.data()));
      });
      emit(getmassageSuccess());
    });
  }
}
