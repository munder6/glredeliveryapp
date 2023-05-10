

import 'package:get/get.dart';
import 'package:glredeliveryapp/core/class/statusrequest.dart';
import 'package:glredeliveryapp/core/functions/handlingdatacontroller.dart';
import 'package:glredeliveryapp/core/services/services.dart';
import 'package:glredeliveryapp/data/model/ordersmodel.dart';
import 'package:glredeliveryapp/data/remote/ordersaccepted_data.dart';
import 'package:glredeliveryapp/data/remote/pendingorders_data.dart';

class OrdersAcceptedController extends GetxController {

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  OrderAcceptedData orderAcceptedData = OrderAcceptedData(Get.find());


  String printOrderType(String val) {
    if (val == "0") {
      return "78".tr;
    } else {
      return "79".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "80".tr;
    }
    if (val == "1") {
      return "81".tr;
    } else {
      return "82".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "83".tr;
    } else if (val == "1") {
      return "84".tr;
    } else if (val == "2") {
      return "85".tr;
    } else if (val == "3") {
      return "84".tr;
    }else {
      return "86".tr;
    }
  }
  getOrder() async {
    //data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderAcceptedData.getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  doneDelivery(String ordersid ,String usersid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderAcceptedData.doneDelivery(ordersid, usersid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      getOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  refreshOrder(){
    getOrder();
  }

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }
}