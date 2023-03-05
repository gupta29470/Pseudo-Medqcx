import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/common/app_helper.dart';
import 'package:pseudo_medqcx/common/navigation_helper.dart';
import 'package:pseudo_medqcx/common/route_helper.dart';
import 'package:pseudo_medqcx/device_list/models/device_list_model.dart';
import 'package:pseudo_medqcx/device_list/widgets/device_card_detail_widget.dart';
import 'package:pseudo_medqcx/styles/themes/button_theme_helper.dart';
import 'package:pseudo_medqcx/styles/themes/decoration_helper.dart';
import 'package:pseudo_medqcx/styles/themes/text_theme_helper.dart';

part '../extensions/device_card_widget_ext.dart';

class DeviceCardWidget extends StatelessWidget {
  final DeviceListModelList model;

  const DeviceCardWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(
        16,
        0,
        16,
        20,
      ),
      decoration: DecorationHelper.deviceCardDecoration,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (AppHelper.isNotEmpty(model.imageUrl)) ...[
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: DecorationHelper.deviceCardProductImageDecoration(
                    model.imageUrl!,
                  ),
                ),
              ],
              DeviceCardDetailWidget(
                key: UniqueKey(),
                deviceModel: model.deviceModel,
                health: model.health,
                manufacturer: model.manufacturer,
                name: model.name,
                serialNumber: model.serialNumber,
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonThemeHelper.raiseComplaintBtnStyle,
                  child: Text(
                    "Raise Complaint",
                    style: TextThemeHelper.white_16_400,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 5,
                child: TextButton(
                  onPressed: () {
                    navigateToDeviceDetailScr(context);
                  },
                  style: ButtonThemeHelper.viewDetailsBtnStyle,
                  child: Text(
                    "View Details",
                    style: TextThemeHelper.royalVessel_16_400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
