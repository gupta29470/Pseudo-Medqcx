part of '../widgets/device_card_detail_widget.dart';

extension on DeviceCardDetailWidget {
  int getRatingLength(int health) {
    return health > 3 ? 3 : health;
  }
}
