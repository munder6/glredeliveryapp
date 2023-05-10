
import 'package:glredeliveryapp/core/class/crud.dart';
import 'package:glredeliveryapp/linkapi.dart';

class OrderAcceptedData {
  Curd curd;

  OrderAcceptedData(this.curd);

  getData(String deliveryid) async {
    var response = await curd.postData(AppLink.ordersAccepted, {
      "id" : deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }

  doneDelivery(String ordersid, String usersid) async {
    var response = await curd.postData(AppLink.ordersDone, {
      "ordersid" : ordersid,
      "usersid" : usersid
    });
    return response.fold((l) => l, (r) => r);
  }
}