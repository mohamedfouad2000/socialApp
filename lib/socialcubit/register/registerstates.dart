

abstract class social_register_States{}
class social_Initial_register_state extends social_register_States{}
class social_register_loding_state extends social_register_States{}
class social_register_succ_state extends social_register_States{}
class social_register_eroor_state extends social_register_States{}


class social_createUser_loding_state extends social_register_States{}
class social_createUser_succ_state extends social_register_States{
  String? uId;
  social_createUser_succ_state({this.uId});
}
class social_createUser_eroor_state extends social_register_States{
  String eroor;
  social_createUser_eroor_state(this.eroor);
  
}


class changePasswordRe extends social_register_States{}

