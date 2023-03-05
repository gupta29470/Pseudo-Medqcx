import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudo_medqcx/common/enums.dart';
import 'package:pseudo_medqcx/common/extensions.dart';
import 'package:pseudo_medqcx/device_list/cubit/device_list_cubit.dart';
import 'package:pseudo_medqcx/device_list/models/device_list_model.dart';
import 'package:pseudo_medqcx/device_list/widgets/device_list_loading_widget.dart';
import 'package:pseudo_medqcx/device_list/widgets/device_list_widget.dart';
import 'package:pseudo_medqcx/styles/colors/app_color_helper.dart';
import 'package:pseudo_medqcx/styles/themes/decoration_helper.dart';
import 'package:pseudo_medqcx/styles/themes/text_theme_helper.dart';

class DeviceListScreen extends StatefulWidget {
  const DeviceListScreen({super.key});

  @override
  State<DeviceListScreen> createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  @override
  void didChangeDependencies() {
    context.deviceListCubit.getDeviceList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.placeboPurple,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.deviceListCubit.getDeviceList();
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: DecorationHelper.deviceListScreenHeaderDecoration,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.device_hub,
                        color: AppColorHelper.royalVessel,
                      ),
                    ),
                    Text(
                      "My Devices",
                      style: TextThemeHelper.black_20_700,
                    ),
                  ],
                ),
              ),
              BlocConsumer<DeviceListCubit, DeviceListState>(
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state.cubitStatus) {
                    case DeviceListCubitStatus.loading:
                      return const DeviceListLoadingWidget();
                    case DeviceListCubitStatus.success:
                      List<DeviceListModelList?> list =
                          state.deviceListModelList.list ?? [];

                      return DeviceListWidget(
                        list: list,
                      );

                    case DeviceListCubitStatus.filter:
                      List<DeviceListModelList?> list =
                          state.filteredDeviceListModelList.list ?? [];

                      return DeviceListWidget(
                        list: list,
                      );

                    case DeviceListCubitStatus.failure:
                      return Center(
                        child: Text(
                          "Something went wrong while getting devices",
                          style: TextThemeHelper.black_16_400,
                          textAlign: TextAlign.center,
                        ),
                      );

                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
