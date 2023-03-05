import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/common/route_helper.dart';
import 'package:pseudo_medqcx/device/screens/device_detail_screen.dart';
import 'package:pseudo_medqcx/device_list/screens/device_list_screen.dart';

class NavigationHelper {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteHelper.deviceDetailScr:
        return getPageTransitionRoute(
          settings,
          const DeviceDetailScreen(),
        );

      default:
        return getPageTransitionRoute(
          settings,
          const DeviceListScreen(),
        );
    }
  }

  static Future<T?> navigateToRoute<T>(
    BuildContext context,
    String routeName,
    dynamic args,
  ) {
    return Navigator.pushNamed(
      context,
      routeName,
      arguments: args,
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static MaterialPageRoute getPageTransitionRoute(
    RouteSettings settings,
    Widget widget,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
