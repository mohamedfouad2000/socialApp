class usermodel {
var name;
  var email;
 var phone;
  var uId;
  var bio;
  var image;
  var cover;

  bool? isemailv;


  usermodel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.isemailv,
    required this.image,
    required this.bio,
    required this.cover,
  });

   usermodel.fromjson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isemailv = json['isemailv'];
    image = json['image'];
    bio = json['bio'];
    cover = json['cover'];
  }

  // عشان ال set بتحتاج map تتحط فيها 
  Map<String, dynamic> TOMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'isemailv':isemailv,
      'bio':bio,
      'image':image,
      'cover':cover,      
    };
  }
}
