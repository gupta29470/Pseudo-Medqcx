import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/styles/colors/app_color_helper.dart';

class DecorationHelper {
  static const BoxDecoration deviceListScreenHeaderDecoration = BoxDecoration(
    color: AppColorHelper.white,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12),
    ),
  );

  static BoxDecoration deviceListCardLoadingDecoration = BoxDecoration(
    color: AppColorHelper.coldMorning,
    borderRadius: BorderRadius.circular(12),
  );

  static BoxDecoration deviceCardDecoration = BoxDecoration(
    color: AppColorHelper.white,
    borderRadius: BorderRadius.circular(12),
  );

  static BoxDecoration deviceCardProductImageDecoration(String image) {
    return BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          image,
        ),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: AppColorHelper.quickSilver,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
