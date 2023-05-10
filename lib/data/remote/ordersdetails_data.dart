
import 'package:glredeliveryapp/core/class/crud.dart';
import 'package:glredeliveryapp/linkapi.dart';

class OrdersDetailsData {
  Curd curd;

  OrdersDetailsData(this.curd);

  getData(String id) async {
    var response = await curd.postData(AppLink.ordersDetails, {
      "id" : id
    });
    return response.fold((l) => l, (r) => r);
  }
}