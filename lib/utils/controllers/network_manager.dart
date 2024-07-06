import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skycast/common/loaders/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubsribtion;

  // Connection State Variable
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubsribtion =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Update Connection Status
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus.value = result.last;

    if (_connectionStatus.value == ConnectivityResult.none) {
      // Loader.warning
      CustomLoaders.warningSnackbar(
          title: 'No Internet Connection',
          message:
              'you are currently offline and that might affect experience');
    }
  }

  // Check Internet Status
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (result.last == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubsribtion.cancel();
  }
}
