
import 'package:glredeliveryapp/core/class/crud.dart';
import 'package:glredeliveryapp/linkapi.dart';

class CheckoutData {
  Curd curd;

  CheckoutData(this.curd);

  checkout(Map data) async {
    var response = await curd.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}