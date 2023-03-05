import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/styles/colors/app_color_helper.dart';

class TextThemeHelper {
  static TextStyle white_12_400 = const TextStyle(
    color: AppColorHelper.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle white_16_600 = const TextStyle(
    color: AppColorHelper.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle white_16_400 = const TextStyle(
    color: AppColorHelper.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black_16_400 = const TextStyle(
    color: AppColorHelper.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black_20_700 = const TextStyle(
    color: AppColorHelper.black,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle black_20_400 = const TextStyle(
    color: AppColorHelper.black,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static TextStyle quickSilver_12_500 = white_12_400.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColorHelper.quickSilver,
  );

  static TextStyle quickSilver_16_400 = white_12_400.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColorHelper.quickSilver,
  );

  static TextStyle coldMorning_12_500 = white_12_400.copyWith(
    color: AppColorHelper.coldMorning,
    fontWeight: FontWeight.w500,
  );

  static TextStyle royalVessel_16_400 = const TextStyle(
    color: AppColorHelper.royalVessel,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black_16_700 = const TextStyle(
    color: AppColorHelper.black,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}
