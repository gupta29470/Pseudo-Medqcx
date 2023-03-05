part of 'device_cubit.dart';

@freezed
class DeviceState with _$DeviceState {
  const DeviceState._();

  const factory DeviceState.initial() = Initial;
  const factory DeviceState.loading() = Loading;
  const factory DeviceState.success({
    required DeviceModel deviceModel,
  }) = Success;
  const factory DeviceState.failure({required String errorText}) = Failure;

  bool get isInitial => this is Initial;
  bool get isLoading => this is Loading;
  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;
}
