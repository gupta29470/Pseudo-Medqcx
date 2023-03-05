class DeviceModelServiceHistory {
/*
{
  "id": 1,
  "service_type": "maintenance"
} 
*/

  int? id;
  String? serviceType;

  DeviceModelServiceHistory({
    this.id,
    this.serviceType,
  });
  DeviceModelServiceHistory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    serviceType = json['service_type']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['service_type'] = serviceType;
    return data;
  }
}

class DeviceModel {
/*
{
  "created_by_id": null,
  "device_model": "v1",
  "image_urls": null,
  "inserted_at": "2023-02-24T16:38:17",
  "last_service_date": "2023-02-24",
  "maintenance_cycle": 45,
  "manufacturer": "tata",
  "name": "x-ray",
  "serial_number": "3311",
  "updated_at": "2023-02-24T16:38:17",
  "updated_by_id": null,
  "warranty_till": "2025-02-24",
  "warranty_type": "AMC",
  "service_history": [
    {
      "id": 1,
      "service_type": "maintenance"
    }
  ]
} 
*/

  String? createdById;
  String? deviceModel;
  String? imageUrls;
  String? insertedAt;
  String? lastServiceDate;
  int? maintenanceCycle;
  String? manufacturer;
  String? name;
  String? serialNumber;
  String? updatedAt;
  String? updatedById;
  String? warrantyTill;
  String? warrantyType;
  List<DeviceModelServiceHistory?>? serviceHistory;

  DeviceModel({
    this.createdById,
    this.deviceModel,
    this.imageUrls,
    this.insertedAt,
    this.lastServiceDate,
    this.maintenanceCycle,
    this.manufacturer,
    this.name,
    this.serialNumber,
    this.updatedAt,
    this.updatedById,
    this.warrantyTill,
    this.warrantyType,
    this.serviceHistory,
  });
  DeviceModel.fromJson(Map<String, dynamic> json) {
    createdById = json['created_by_id']?.toString();
    deviceModel = json['device_model']?.toString();
    imageUrls = json['image_urls']?.toString();
    insertedAt = json['inserted_at']?.toString();
    lastServiceDate = json['last_service_date']?.toString();
    maintenanceCycle = json['maintenance_cycle']?.toInt();
    manufacturer = json['manufacturer']?.toString();
    name = json['name']?.toString();
    serialNumber = json['serial_number']?.toString();
    updatedAt = json['updated_at']?.toString();
    updatedById = json['updated_by_id']?.toString();
    warrantyTill = json['warranty_till']?.toString();
    warrantyType = json['warranty_type']?.toString();
    if (json['service_history'] != null) {
      final v = json['service_history'];
      final arr0 = <DeviceModelServiceHistory>[];
      v.forEach((v) {
        arr0.add(DeviceModelServiceHistory.fromJson(v));
      });
      serviceHistory = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['created_by_id'] = createdById;
    data['device_model'] = deviceModel;
    data['image_urls'] = imageUrls;
    data['inserted_at'] = insertedAt;
    data['last_service_date'] = lastServiceDate;
    data['maintenance_cycle'] = maintenanceCycle;
    data['manufacturer'] = manufacturer;
    data['name'] = name;
    data['serial_number'] = serialNumber;
    data['updated_at'] = updatedAt;
    data['updated_by_id'] = updatedById;
    data['warranty_till'] = warrantyTill;
    data['warranty_type'] = warrantyType;
    if (serviceHistory != null) {
      final v = serviceHistory;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['service_history'] = arr0;
    }
    return data;
  }

  DeviceModel.isEmpty();
}
