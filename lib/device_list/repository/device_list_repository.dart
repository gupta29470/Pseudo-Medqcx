import 'dart:developer';

import 'package:pseudo_medqcx/device_list/models/device_list_model.dart';
import 'package:pseudo_medqcx/network/constants/apis.dart';
import 'package:pseudo_medqcx/network/helpers/api_base_helper.dart';
import 'package:pseudo_medqcx/network/helpers/base_network_response.dart';

class DeviceListRepository {
  static const String tag = "DeviceListRepository";

  DeviceListRepository() {
    APIBaseHelper.init();
  }

  Future<DeviceListModel> getDeviceList() async {
    try {
      BaseNetworkResponse response =
          await APIBaseHelper.get(url: APIs.getDeviceList);

      if (response.isSuccess() &&
          response.response?.data != null &&
          response.response?.data.isNotEmpty) {
        return DeviceListModel.fromJson(
          response.response?.data,
        );
      } else {
        log("$tag ====== ${response.httpCode}");
        return DeviceListModel.isEmpty();
      }
    } catch (error) {
      log("$tag ====== $error");
      return DeviceListModel.isEmpty();
    }
  }
}
