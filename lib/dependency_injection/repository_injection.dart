import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudo_medqcx/device/repository/device_repository.dart';
import 'package:pseudo_medqcx/device_list/repository/device_list_repository.dart';

class RepositoryInjection extends StatelessWidget {
  final Widget child;

  const RepositoryInjection({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DeviceListRepository(),
        ),
        RepositoryProvider(
          create: (context) => DeviceRepository(),
        ),
      ],
      child: child,
    );
  }
}
