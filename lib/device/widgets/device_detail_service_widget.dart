import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/styles/themes/button_theme_helper.dart';
import 'package:pseudo_medqcx/styles/themes/text_theme_helper.dart';

class DeviceDetailServiceWidget extends StatelessWidget {
  final String title;

  const DeviceDetailServiceWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextThemeHelper.black_16_700,
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              style: ButtonThemeHelper.viewDetailsBtnStyle,
              child: Text(
                "View Report",
                style: TextThemeHelper.royalVessel_16_400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
