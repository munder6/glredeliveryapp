
import 'package:glredeliveryapp/core/class/crud.dart';
import 'package:glredeliveryapp/linkapi.dart';

class OrderArchiveData {
  Curd curd;

  OrderArchiveData(this.curd);

  getData(String deliveryid) async {
    var response = await curd.postData(AppLink.orderArchive, {
      "id" : deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }

  rating(String ordersid, String comment, String rating) async {
    var response = await curd.postData(AppLink.rating, {
      "id" : ordersid,
      "rating" : rating,
      "comment" : comment
    });
    return response.fold((l) => l, (r) => r);
  }
  
}