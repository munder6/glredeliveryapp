
import 'package:glredeliveryapp/core/class/crud.dart';
import 'package:glredeliveryapp/linkapi.dart';

class ItemsData {
  Curd curd;

  ItemsData(this.curd);

  getData(String id , String userid) async {
    var response = await curd.postData(AppLink.items, {"id" : id.toString(), "userid" : userid});
    return response.fold((l) => l, (r) => r);
  }
}