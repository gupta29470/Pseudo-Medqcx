import 'dart:developer';

import 'package:pseudo_medqcx/device/models/device_model.dart';
import 'package:pseudo_medqcx/network/constants/apis.dart';
import 'package:pseudo_medqcx/network/helpers/api_base_helper.dart';
import 'package:pseudo_medqcx/network/helpers/base_network_response.dart';

class DeviceRepository {
  static const String tag = "DeviceRepository";

  DeviceRepository() {
    APIBaseHelper.init();
  }

  Future<DeviceModel?> getDevice() async {
    try {
      BaseNetworkResponse response =
          await APIBaseHelper.get(url: APIs.getDevice);

      if (response.isSuccess() &&
          response.response?.data != null &&
          response.response?.data.isNotEmpty) {
        return DeviceModel.fromJson(
          response.response?.data,
        );
      } else {
        log("$tag ====== ${response.httpCode}");
        return null;
      }
    } catch (error) {
      log("$tag ====== $error");
      return null;
    }
  }
}
