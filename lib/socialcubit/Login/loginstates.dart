// ignore: camel_case_types


abstract class social_Login_States{}
class social_Initial_state extends social_Login_States{}
class social_Login_loding_state extends social_Login_States{}
class social_Login_success_state extends social_Login_States{
String uId;
social_Login_success_state(this.uId);
}
class social_Login_Error_state extends social_Login_States{
  final String error;
  social_Login_Error_state(this.error);
}
class changePassword extends social_Login_States{}



