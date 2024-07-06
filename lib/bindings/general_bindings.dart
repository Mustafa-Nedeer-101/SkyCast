import 'package:get/get.dart';
import 'package:skycast/weather/controllers/location_controller.dart';
import 'package:skycast/utils/controllers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // Inject the Location controller
    Get.put(LocationController(), permanent: true);

    // Inject Network Manager
    Get.put(NetworkManager(), permanent: true);
  }
}
