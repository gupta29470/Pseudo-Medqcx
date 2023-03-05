import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudo_medqcx/common/constants.dart';
import 'package:pseudo_medqcx/common/enums.dart';
import 'package:pseudo_medqcx/common/hive_helper.dart';
import 'package:pseudo_medqcx/device_list/models/device_list_model.dart';
import 'package:pseudo_medqcx/device_list/repository/device_list_repository.dart';

part 'device_list_state.dart';

class DeviceListCubit extends Cubit<DeviceListState> {
  final DeviceListRepository _deviceListRepository;

  DeviceListCubit(this._deviceListRepository)
      : super(
          DeviceListState(),
        );

  Future<void> getDeviceList() async {
    emit(
      state.copyWith(
        cubitStatus: DeviceListCubitStatus.loading,
      ),
    );
    DeviceListModel? cachedDeviceListModel = await HiveHelper.getDeviceList();

    try {
      DeviceListModel deviceListModel =
          await _deviceListRepository.getDeviceList();

      if (deviceListModel.list?.isNotEmpty == true) {
        emit(
          state.copyWith(
            cubitStatus: DeviceListCubitStatus.success,
            deviceListModelList: deviceListModel,
          ),
        );
        HiveHelper.saveDeviceList(
          deviceListModel: deviceListModel,
        );
      } else {
        if (cachedDeviceListModel != null) {
          emit(
            state.copyWith(
              cubitStatus: DeviceListCubitStatus.success,
              deviceListModelList: cachedDeviceListModel,
            ),
          );
        } else {
          emit(
            state.copyWith(
              cubitStatus: DeviceListCubitStatus.failure,
            ),
          );
        }
      }
    } catch (error) {
      if (cachedDeviceListModel != null) {
        emit(
          state.copyWith(
            cubitStatus: DeviceListCubitStatus.success,
            deviceListModelList: cachedDeviceListModel,
          ),
        );
      } else {
        emit(
          state.copyWith(
            cubitStatus: DeviceListCubitStatus.failure,
          ),
        );
      }
    }
  }

  void filterDeviceList(String filterValue) {
    emit(
      state.copyWith(
        cubitStatus: DeviceListCubitStatus.loading,
      ),
    );

    if (filterValue == Constants.deviceFilterList[0]) {
      emit(
        state.copyWith(
          cubitStatus: DeviceListCubitStatus.success,
          deviceListModelList: state.deviceListModelList,
        ),
      );
    } else {
      filterValue = filterValue.toLowerCase();
      List<DeviceListModelList?>? list = [];
      for (int index = 0;
          index < (state.deviceListModelList.list?.length ?? 0);
          index++) {
        if (filterValue == state.deviceListModelList.list?[index]?.status) {
          list.add(state.deviceListModelList.list?[index]);
        }
      }
      emit(
        state.copyWith(
          cubitStatus: DeviceListCubitStatus.filter,
          filteredDeviceListModelList: DeviceListModel(
            list: list,
          ),
        ),
      );
    }
  }
}
