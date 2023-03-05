import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pseudo_medqcx/device/models/device_model.dart';
import 'package:pseudo_medqcx/device/repository/device_repository.dart';

part 'device_state.dart';
part 'device_cubit.freezed.dart';

class DeviceCubit extends Cubit<DeviceState> {
  final DeviceRepository _deviceRepository;

  DeviceCubit(this._deviceRepository)
      : super(
          const DeviceState.initial(),
        );

  Future<void> getDevice() async {
    emit(const DeviceState.loading());
    try {
      DeviceModel? deviceModel = await _deviceRepository.getDevice();

      if (deviceModel != null) {
        emit(
          DeviceState.success(deviceModel: deviceModel),
        );
      } else {
        emit(
          const DeviceState.failure(
            errorText: "Something went wrong while get device",
          ),
        );
      }
    } catch (error) {
      emit(
        DeviceState.failure(errorText: "$error"),
      );
    }
  }
}
