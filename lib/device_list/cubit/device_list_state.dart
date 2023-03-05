part of 'device_list_cubit.dart';

class DeviceListState extends Equatable {
  final DeviceListCubitStatus cubitStatus;
  final DeviceListModel deviceListModelList;
  final DeviceListModel filteredDeviceListModelList;

  DeviceListState(
      {this.cubitStatus = DeviceListCubitStatus.initial,
      DeviceListModel? deviceListModelList,
      DeviceListModel? filteredDeviceListModelList})
      : deviceListModelList = deviceListModelList ?? DeviceListModel.isEmpty(),
        filteredDeviceListModelList =
            filteredDeviceListModelList ?? DeviceListModel.isEmpty();

  DeviceListState copyWith(
      {DeviceListCubitStatus? cubitStatus,
      DeviceListModel? deviceListModelList,
      DeviceListModel? filteredDeviceListModelList}) {
    return DeviceListState(
      cubitStatus: cubitStatus ?? this.cubitStatus,
      deviceListModelList: deviceListModelList ?? this.deviceListModelList,
      filteredDeviceListModelList:
          filteredDeviceListModelList ?? this.filteredDeviceListModelList,
    );
  }

  @override
  List<Object?> get props => [
        cubitStatus,
        deviceListModelList,
        filteredDeviceListModelList,
      ];
}
