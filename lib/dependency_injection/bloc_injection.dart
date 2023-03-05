import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudo_medqcx/device/cubit/device_cubit.dart';
import 'package:pseudo_medqcx/device/repository/device_repository.dart';
import 'package:pseudo_medqcx/device_list/cubit/device_list_cubit.dart';
import 'package:pseudo_medqcx/device_list/repository/device_list_repository.dart';

class BlocInjection extends StatelessWidget {
  final Widget child;

  const BlocInjection({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeviceListCubit(
            RepositoryProvider.of<DeviceListRepository>(
              context,
              listen: false,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => DeviceCubit(
            RepositoryProvider.of<DeviceRepository>(
              context,
              listen: false,
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
