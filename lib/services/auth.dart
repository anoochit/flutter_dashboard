import 'package:shared_preferences/shared_preferences.dart';

Future<bool> userAuth({String user, String pass}) async {
  // TODO : change auth for properly
  if ((user == "admin") && (pass == "pass")) {
    setLoginState(status: true);
    return true;
  } else {
    setLoginState(status: false);
    return false;
  }
}

Future<bool> isLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var result = prefs.getBool("auth") ?? false;
  return result;
}

setLoginState({bool status}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("auth", status);
}
