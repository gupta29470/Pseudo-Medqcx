class DeviceListModelList {
/*
{
  "device_model": "v1",
  "id": "9c72fe0a-817c-465e-8111-8d637fff5d38",
  "manufacturer": "philips",
  "name": "CT machine",
  "serial_number": "134214",
  "health": 6,
  "status": "working",
  "image_url": "https://marketing.webassets.siemens-healthineers.com/2a94d46f344cf4fc/ba997d636633/v/77a8ec27432e/siemens-healthineers_CT_SOMATOM_X.ceed.png"
} 
*/

  String? deviceModel;
  String? id;
  String? manufacturer;
  String? name;
  String? serialNumber;
  int? health;
  String? status;
  String? imageUrl;

  DeviceListModelList({
    this.deviceModel,
    this.id,
    this.manufacturer,
    this.name,
    this.serialNumber,
    this.health,
    this.status,
    this.imageUrl,
  });
  DeviceListModelList.fromJson(Map<dynamic, dynamic> json) {
    deviceModel = json['device_model']?.toString();
    id = json['id']?.toString();
    manufacturer = json['manufacturer']?.toString();
    name = json['name']?.toString();
    serialNumber = json['serial_number']?.toString();
    health = json['health']?.toInt();
    status = json['status']?.toString();
    imageUrl = json['image_url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['device_model'] = deviceModel;
    data['id'] = id;
    data['manufacturer'] = manufacturer;
    data['name'] = name;
    data['serial_number'] = serialNumber;
    data['health'] = health;
    data['status'] = status;
    data['image_url'] = imageUrl;
    return data;
  }
}

class DeviceListModel {
/*
{
  "list": [
    {
      "device_model": "v1",
      "id": "9c72fe0a-817c-465e-8111-8d637fff5d38",
      "manufacturer": "philips",
      "name": "CT machine",
      "serial_number": "134214",
      "health": 6,
      "status": "working",
      "image_url": "https://marketing.webassets.siemens-healthineers.com/2a94d46f344cf4fc/ba997d636633/v/77a8ec27432e/siemens-healthineers_CT_SOMATOM_X.ceed.png"
    }
  ]
} 
*/

  List<DeviceListModelList?>? list;

  DeviceListModel({
    this.list,
  });
  DeviceListModel.fromJson(Map<dynamic, dynamic> json) {
    if (json['list'] != null) {
      final v = json['list'];
      final arr0 = <DeviceListModelList>[];
      v.forEach((v) {
        arr0.add(DeviceListModelList.fromJson(v));
      });
      list = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (list != null) {
      final v = list;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['list'] = arr0;
    }
    return data;
  }

  DeviceListModel.isEmpty();
}
