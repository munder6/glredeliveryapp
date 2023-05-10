import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glredeliveryapp/controller/orders/ordersdetails_controller.dart';
import 'package:glredeliveryapp/controller/tracking_controller.dart';
import 'package:glredeliveryapp/core/class/handlingdataview.dart';
import 'package:glredeliveryapp/core/constant/color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class OrderTracking extends StatelessWidget {
  const OrderTracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrackingController controller = Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("156".tr, style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GetBuilder<TrackingController> (
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                  Expanded(
                    child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    padding: const EdgeInsets.all(10),
                    child: GoogleMap(
                      markers: controller.markers.toSet(),
                      mapType: MapType.hybrid,
                      initialCameraPosition: controller.cameraPosition!,
                      onMapCreated: (GoogleMapController controllermap) {
                        controller.gmc = controllermap;
                      },
                    ),
                ),
                  )
              ],
            )),
      ),
    );
  }
}
