


class UserAccessModel{

  static UserAccessModel shareModel(){
    if(accessModel == null){
      accessModel = new UserAccessModel();
    }
    return accessModel;
  }

  static UserAccessModel accessModel;

  //用户id
  int userId;

  //用户平台token
  String accessToken;

  //刷新平台token
  String refreshToken;

  //过期时间
  int expiredTime;

  String userName;

}