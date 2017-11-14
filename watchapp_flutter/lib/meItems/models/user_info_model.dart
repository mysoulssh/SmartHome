class UserInfoModel{

  // true; 用户ID
  int user_id;
  String user_name;
  String like_name;
  String sign;
  String pic_fileid; // 头像图片

  // 上面信息对陌生人开放

  // true; 生日年份,例如：2004年该值为2004.
  int birth_year;
  // true;生日月份，例如: 5月该值为5
  int birth_month;
  // true;生日日期，例如： 20日该值为20
  int birth_day;
  // true;性别（1,男；2，女；3，中性）
  int sex;
  // false; 公司代码
  String company_code;

  // 上面所有信息对好友开放

  int height;
  int weight;
  int target_step;
  String card_id;

  // true; 经度
  int longitude;
  // true; 纬度
  int latitude;
  // true; 小区名称或者位置名称
  String site_name;

}