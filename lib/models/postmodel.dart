class Postmodel {
  var name;
  var uId;
  var image;
  var datatime;
  var text;
  var postimage;

  Postmodel({
    required this.name,
    required this.datatime,
    required this.text,
    required this.uId,
    required this.postimage,
    required this.image,
  });

  Postmodel.fromjson(Map<String, dynamic> json) {
    datatime = json['datatime'];
    name = json['name'];
    text = json['text'];
    uId = json['uId'];
    postimage = json['postimage'];
    image = json['image'];
  }

  // عشان ال set بتحتاج map تتحط فيها
  Map<String, dynamic> TOMap() {
    return {
      'name': name,
      'uId': uId,
      'datatime': datatime,
      'text': text,
      'image': image,
      'postimage': postimage,
    };
  }
}
