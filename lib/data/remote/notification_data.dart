
import 'package:glredeliveryapp/core/class/crud.dart';
import 'package:glredeliveryapp/linkapi.dart';

class NotificationData {
  Curd curd;

  NotificationData(this.curd);

  getData(String id) async {
    var response = await curd.postData(AppLink.notification, {"id" : id});
    return response.fold((l) => l, (r) => r);
  }
}