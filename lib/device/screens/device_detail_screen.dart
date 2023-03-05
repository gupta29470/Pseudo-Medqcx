import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudo_medqcx/common/app_helper.dart';
import 'package:pseudo_medqcx/common/extensions.dart';
import 'package:pseudo_medqcx/device/cubit/device_cubit.dart';
import 'package:pseudo_medqcx/device/widgets/device_detail_certification_widget.dart';
import 'package:pseudo_medqcx/device/widgets/device_detail_service_widget.dart';
import 'package:pseudo_medqcx/device_list/widgets/device_card_detail_widget.dart';
import 'package:pseudo_medqcx/styles/colors/app_color_helper.dart';
import 'package:pseudo_medqcx/styles/themes/button_theme_helper.dart';
import 'package:pseudo_medqcx/styles/themes/decoration_helper.dart';
import 'package:pseudo_medqcx/styles/themes/text_theme_helper.dart';

class DeviceDetailScreen extends StatefulWidget {
  static const String tag = "DeviceDetailScreen";

  const DeviceDetailScreen({super.key});

  @override
  State<DeviceDetailScreen> createState() => _DeviceDetailScreenState();
}

class _DeviceDetailScreenState extends State<DeviceDetailScreen> {
  @override
  void didChangeDependencies() {
    context.deviceCubit.getDevice();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 56,
                    bottom: 28,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Device Details",
                        style: TextThemeHelper.black_20_700,
                      )
                    ],
                  ),
                ),
                BlocBuilder<DeviceCubit, DeviceState>(
                  builder: ((context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const SizedBox.shrink();
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColorHelper.royalVessel,
                          ),
                        );
                      },
                      success: (model) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: Text(
                                "DEVICE INFO",
                                style: TextThemeHelper.royalVessel_16_400,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 28,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    margin: const EdgeInsets.only(right: 16),
                                    decoration: DecorationHelper
                                        .deviceCardProductImageDecoration(
                                      model.imageUrls ??
                                          "https://marketing.webassets.siemens-healthineers.com/2a94d46f344cf4fc/ba997d636633/v/77a8ec27432e/siemens-healthineers_CT_SOMATOM_X.ceed.png",
                                    ),
                                  ),
                                  DeviceCardDetailWidget(
                                    deviceModel: model.deviceModel,
                                    health: 0,
                                    manufacturer: model.manufacturer,
                                    name: model.name,
                                    serialNumber: model.serialNumber,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Row(
                                children: [
                                  Text(
                                    "CONTRACTS AND CERTIFICATIONS",
                                    style: TextThemeHelper.royalVessel_16_400,
                                  ),
                                  const SizedBox(width: 24),
                                  const Icon(
                                    Icons.edit,
                                    color: AppColorHelper.royalVessel,
                                  ),
                                ],
                              ),
                            ),
                            DeviceDetailCertificationWidget(
                              description:
                                  AppHelper.isNotEmpty(model.warrantyType)
                                      ? "Yes"
                                      : "No",
                              title: "Warranty",
                            ),
                            const DeviceDetailCertificationWidget(
                              description: "No",
                              title: "Insurance",
                            ),
                            const DeviceDetailCertificationWidget(
                              description: "No",
                              title: "Additional Certificates",
                            ),
                            DeviceDetailCertificationWidget(
                              description: model.warrantyType ?? "AMC",
                              title: "AMC / CMC",
                            ),
                            DeviceDetailCertificationWidget(
                              description: AppHelper.dateFormatDDMMYYYY(
                                model.lastServiceDate,
                              ),
                              title: "Last Service Date",
                            ),
                            DeviceDetailCertificationWidget(
                              description: "${model.maintenanceCycle ?? 30}",
                              title: "Maintenance Cycle",
                            ),
                            DeviceDetailCertificationWidget(
                              description: AppHelper.dateFormatDDMMYYYY(
                                model.lastServiceDate,
                              ),
                              title: "Next Service Date",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 24, top: 16),
                              child: Text(
                                "SERVICE HISTORY",
                                style: TextThemeHelper.royalVessel_16_400,
                              ),
                            ),
                            const DeviceDetailServiceWidget(
                              title: "01 01 2023",
                            ),
                            const DeviceDetailServiceWidget(
                              title: "01 01 2023",
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {},
                                    style: ButtonThemeHelper
                                        .raiseComplaintBtnStyle,
                                    child: Text(
                                      "Troubleshoot",
                                      style: TextThemeHelper.white_16_600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            )
                          ],
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
