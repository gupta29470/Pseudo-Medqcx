import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/styles/colors/app_color_helper.dart';

class ButtonThemeHelper {
  static ButtonStyle raiseComplaintBtnStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColorHelper.periwinkle,
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.all(16),
    ),
    shape: MaterialStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
  );

  static ButtonStyle viewDetailsBtnStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColorHelper.coldMorning,
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.all(16),
    ),
    shape: MaterialStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
  );
}
