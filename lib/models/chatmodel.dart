 

  class chatmodel {
  var text;
  var datatime;
  var reciveruid;
  var senderuid;

 chatmodel({
    required this.datatime,
    required this.text,
    required this.reciveruid,
    required this.senderuid,

  });

 chatmodel.fromjson(Map<String, dynamic> json) {
    datatime = json['datatime'];
    text = json['text'];
    reciveruid = json['reciveruid'];
    senderuid = json['senderuid'];

  }

  // عشان ال set بتحتاج map تتحط فيها
  Map<String, dynamic> TOMap() {
    return {

      'datatime': datatime,
      'text': text,
      'reciveruid': reciveruid,
      'senderuid': senderuid,
    };
  }
}
