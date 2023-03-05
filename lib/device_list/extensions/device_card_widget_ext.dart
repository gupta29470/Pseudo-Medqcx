part of '../widgets/device_card_widget.dart';

extension on DeviceCardWidget {
  void navigateToDeviceDetailScr(BuildContext context) {
    NavigationHelper.navigateToRoute(
      context,
      RouteHelper.deviceDetailScr,
      null,
    );
  }
}
