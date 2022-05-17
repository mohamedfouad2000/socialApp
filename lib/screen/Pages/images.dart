import 'dart:io';

import 'package:image_picker/image_picker.dart';

ImagePicker picker = ImagePicker();
    File ?image ;
Future<void> getphoto() async {
 var pickedfile = await picker.pickImage(source: ImageSource.gallery);
 if(pickedfile !=null)
 {
  image=File(pickedfile.path);
 }
 else{
   print("No Image");
 }
}