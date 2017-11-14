import 'package:crypto/crypto.dart';

class MD5Text{
  static String convertMD5(String text){
    List<int> data = text.runes.toList(growable: false);
    String result = md5.convert(data).toString();
    return result;
  }
}