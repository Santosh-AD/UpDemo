part of 'screen_util.dart';

extension SizeExtension on num {
  ///gives the
  ///[ScreenUtilInit.setWidth]
  double get w => ScreenUtilInit().setWidth(this);
  double get h => ScreenUtilInit().setHeight(this);
  double get r => ScreenUtilInit().radius(this);
  double get sp => ScreenUtilInit().setSp(this);
  double get sh => ScreenUtilInit().screenHeight * this;

  ///
  double get sw => ScreenUtilInit().screenWidth * this;
}

extension SizeExtensionDouble on double {
  ///gives the
  ///[ScreenUtilInit.setWidth]
  double get w => ScreenUtilInit().setWidth(this);
  double get h => ScreenUtilInit().setHeight(this);
  double get r => ScreenUtilInit().radius(this);
  double get sp => ScreenUtilInit().setSp(this);
  double get sh => ScreenUtilInit().screenHeight * this;

  ///
  double get sw => ScreenUtilInit().screenWidth * this;
}

extension SizeExtensionInt on int {
  ///gives the
  ///[ScreenUtilInit.setWidth]
  double get w => ScreenUtilInit().setWidth(this);
  double get h => ScreenUtilInit().setHeight(this);
  double get r => ScreenUtilInit().radius(this);
  double get sp => ScreenUtilInit().setSp(this);
  double get sh => ScreenUtilInit().screenHeight * this;

  ///
  double get sw => ScreenUtilInit().screenWidth * this;
}
