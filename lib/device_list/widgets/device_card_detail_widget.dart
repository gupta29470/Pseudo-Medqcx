import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/common/app_helper.dart';
import 'package:pseudo_medqcx/styles/colors/app_color_helper.dart';
import 'package:pseudo_medqcx/styles/themes/text_theme_helper.dart';

part '../extensions/device_card_detail_widget_ext.dart';

class DeviceCardDetailWidget extends StatelessWidget {
  final String? name;
  final String? manufacturer;
  final String? deviceModel;
  final String? serialNumber;
  final int? health;

  const DeviceCardDetailWidget({
    super.key,
    required this.deviceModel,
    required this.health,
    required this.manufacturer,
    required this.name,
    required this.serialNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (AppHelper.isNotEmpty(name)) ...[
                  Text(
                    "$name".toUpperCase(),
                    style: TextThemeHelper.quickSilver_16_400,
                  ),
                ],
                const SizedBox(height: 4),
                if (AppHelper.isNotEmpty(manufacturer)) ...[
                  Text(
                    "$manufacturer".toUpperCase(),
                    style: TextThemeHelper.quickSilver_12_500,
                  )
                ],
                const SizedBox(height: 8),
                if (AppHelper.isNotEmpty(deviceModel) &&
                    deviceModel?.contains("v") == true) ...[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Model: ",
                          style: TextThemeHelper.coldMorning_12_500,
                        ),
                        TextSpan(
                          text: "$deviceModel".split("v")[1],
                          style: TextThemeHelper.quickSilver_12_500,
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 4),
                if (AppHelper.isNotEmpty(serialNumber)) ...[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Serial No: ",
                          style: TextThemeHelper.coldMorning_12_500,
                        ),
                        TextSpan(
                          text: "$serialNumber",
                          style: TextThemeHelper.quickSilver_12_500,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (health != null) ...[
            Row(
              children: [
                for (int index = 0; index < 3; index++) ...[
                  Icon(
                    index < health! ? Icons.favorite : Icons.favorite_border,
                    color: AppColorHelper.rage,
                  ),
                ],
                const SizedBox(width: 8),
                Text(
                  "${getRatingLength(health!)} / 3",
                  style: TextThemeHelper.quickSilver_12_500,
                )
              ],
            ),
          ],
        ],
      ),
    );
  }
}
