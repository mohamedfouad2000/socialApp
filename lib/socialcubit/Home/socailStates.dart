abstract class socailHomeStates{}
class socialInitialHomestate extends socailHomeStates{}
class social_Home_loding_state extends socailHomeStates{}
class social_Home_succ_state extends socailHomeStates{}
class social_Home_eroor_state extends socailHomeStates{
  String eroor;
  social_Home_eroor_state(this.eroor);
  
}
class create_post_loding_state extends socailHomeStates{}
class create_post_succ_state extends socailHomeStates{}
class create_post_eroor_state extends socailHomeStates{
  String eroor;
  create_post_eroor_state(this.eroor);
  
} 
class create_user_chat_loding_state extends socailHomeStates{}
class create_user_chat_succ_state extends socailHomeStates{}
class create_user_chat_eroor_state extends socailHomeStates{
  String eroor;
  create_user_chat_eroor_state(this.eroor);
  
}

class create_like_succ_state extends socailHomeStates{}
class create_like_eroor_state extends socailHomeStates{
  String eroor;
  create_like_eroor_state(this.eroor);
  
}
class create_comment_succ_state extends socailHomeStates{}
class create_comment_eroor_state extends socailHomeStates{
  String eroor;
  create_comment_eroor_state(this.eroor);
  
}

class Change_nav_index extends socailHomeStates{}
//بتاع تغيير ال bar الي عندي 
class Post_state extends socailHomeStates{}

class profileeditstatesucc extends socailHomeStates{}
class profileeditstateeroor extends socailHomeStates{}
class covereditstatesucc extends socailHomeStates{}
class covereditstateeroor extends socailHomeStates{}

class updateProfsucc extends socailHomeStates{}
class updateProferoor extends socailHomeStates{}
class updateCoversucc extends socailHomeStates{}
class updateCovereroor extends socailHomeStates{}
class updateuserdataloading extends socailHomeStates{}

class updateuserdataeroor extends socailHomeStates{}


class updateuserprofileloading extends socailHomeStates{}
class updateusercoverloading extends socailHomeStates{}


class createPostloading extends socailHomeStates{}
class createPostsucces extends socailHomeStates{}
class createPosteroor extends socailHomeStates{}

class postimageesucc extends socailHomeStates{}
class postimageeeroor extends socailHomeStates{}

class removepostimagestate extends socailHomeStates{}



class sendmassagesloading extends socailHomeStates{}
class sendmassagessucces extends socailHomeStates{}
class sendmassageseroor extends socailHomeStates{}

class getmassageSuccess extends socailHomeStates{}





