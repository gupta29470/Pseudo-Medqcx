import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pseudo_medqcx/device_list/models/device_list_model.dart';

class HiveHelper {
  static const String tag = "HiveHelper";

  static String get deviceListBox => 'deviceListBox';

  static Future<void> initHive() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    return;
  }

  static Future<Box> getBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) return Hive.box(boxName);
    return await Hive.openBox(boxName);
  }

  static Future<Box> getDeviceListBox() async {
    return await getBox(deviceListBox);
  }

  static Future<void> saveDeviceList({
    required DeviceListModel deviceListModel,
  }) async {
    try {
      var box = await getDeviceListBox();
      box.put(deviceListBox, deviceListModel.toJson());

      log("$tag, ${box.get(deviceListBox)}");
    } catch (error) {
      log("$tag, $error");
      return;
    }
  }

  static Future<DeviceListModel?> getDeviceList() async {
    try {
      var box = await getDeviceListBox();
      Map<dynamic, dynamic>? map = box.get(deviceListBox);
      if (map != null && map.isNotEmpty) {
        return DeviceListModel.fromJson(map);
      } else {
        return null;
      }
    } catch (error) {
      log("$tag, $error");
      return null;
    }
  }
}
