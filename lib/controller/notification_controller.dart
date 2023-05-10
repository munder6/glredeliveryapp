

import 'package:get/get.dart';
import 'package:glredeliveryapp/core/class/statusrequest.dart';
import 'package:glredeliveryapp/core/functions/handlingdatacontroller.dart';
import 'package:glredeliveryapp/core/services/services.dart';
import 'package:glredeliveryapp/data/remote/notification_data.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  MyServices myServices = Get.find();

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData.getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}