import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/styles/themes/decoration_helper.dart';

class DeviceListLoadingWidget extends StatelessWidget {
  const DeviceListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: DecoratedBox(
                decoration: DecorationHelper.deviceListCardLoadingDecoration,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
