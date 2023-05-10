
import 'package:glredeliveryapp/core/class/crud.dart';
import 'package:glredeliveryapp/linkapi.dart';

class LogInData {
  Curd curd;

  LogInData(this.curd);

  postdata(String email, String password) async {
    var response = await curd.postData(AppLink.login, {
      "email" : email ,
      "password" : password,

    });
    return response.fold((l) => l, (r) => r);
  }
}