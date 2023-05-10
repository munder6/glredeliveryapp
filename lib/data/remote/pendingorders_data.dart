
import 'package:glredeliveryapp/core/class/crud.dart';
import 'package:glredeliveryapp/linkapi.dart';

class OrderPendingData {
  Curd curd;

  OrderPendingData(this.curd);

  getData() async {
    var response = await curd.postData(AppLink.orderPending, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(String deliveryid, String userid, String ordersid) async {
    var response = await curd.postData(AppLink.ordersApprove, {
      "deliveryid" : deliveryid,
      "usersid" : userid,
      "ordersid" : ordersid

    });
    return response.fold((l) => l, (r) => r);
  }
}