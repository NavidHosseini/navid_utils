import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:navid_utils/utils/loading/loading.dart';

class CheckConnectionStream extends GetxController {
  late BuildContext context;
  CheckConnectionStream({required this.context});
  bool isModalEnable = false;
  final loadingCheckConnectivity = false.obs;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();

      loadingCheckConnectivity.value = false;
    } on PlatformException catch (e) {
      return;
    }

    // // If the widget was removed from the tree while the asynchronous platform
    // // message was in flight, we want to discard the reply rather than calling
    // // setState to update our non-existent appearance.
    // if (!mounted) {
    //   return Future.value(null);
    // }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;

    if (result == ConnectivityResult.none) {
      if (isModalEnable != true) {
        isModalEnable = true;
        showDialogIfNotConnect();
      }
    } else {
      if (isModalEnable) {
        Get.back();
      }
      isModalEnable = false;
    }
  }

  showDialogIfNotConnect() {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "check your network".tr,
        onWillPop: () async {
          return false;
        },
        middleText: "Your device is not currently connected to the Internet".tr,
        // backgroundColor: Colors.teal,
        titleStyle: const TextStyle(color: Colors.black),
        middleTextStyle: const TextStyle(color: Colors.black),
        radius: 30,
        actions: [
          Obx(() => loadingCheckConnectivity.value
              ? const CustomLoading(
                  height: 30.0,
                  radius: 30.0,
                  // color: Colors.white,
                )
              : ElevatedButton(
                  onPressed: () async {
                    loadingCheckConnectivity.value = true;
                    EasyDebounce.debounce('check connectivity',
                        const Duration(milliseconds: 1000), () async {
                      await initConnectivity();
                    });
                    // loadingCheckConnectivity.value = false;
                  },
                  child: Text(
                    'try again'.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ))
        ]);
  }

  @override
  void onInit() {
    super.onInit();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
