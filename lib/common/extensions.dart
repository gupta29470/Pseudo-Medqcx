import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudo_medqcx/common/enums.dart';
import 'package:pseudo_medqcx/device/cubit/device_cubit.dart';
import 'package:pseudo_medqcx/device_list/cubit/device_list_cubit.dart';

extension BuildContextX on BuildContext {
  DeviceListCubit get deviceListCubit => read<DeviceListCubit>();

  DeviceCubit get deviceCubit => read<DeviceCubit>();
}

extension CubitStateX on DeviceListCubitStatus {
  bool get isInitial => this == DeviceListCubitStatus.initial;

  bool get isLoading => this == DeviceListCubitStatus.loading;

  bool get isSuccess => this == DeviceListCubitStatus.success;

  bool get isFailure => this == DeviceListCubitStatus.failure;

  bool get isFiltered => this != DeviceListCubitStatus.filter;
}
