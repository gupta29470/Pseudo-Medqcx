import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/styles/themes/text_theme_helper.dart';

class DeviceDetailCertificationWidget extends StatelessWidget {
  final String title;
  final String description;

  const DeviceDetailCertificationWidget({
    super.key,
    required this.description,
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
            child: Text(
              description,
              style: TextThemeHelper.quickSilver_16_400,
            ),
          ),
        ],
      ),
    );
  }
}
