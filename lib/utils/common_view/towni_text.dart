import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemoapp/utils/colors/app_colors.dart';
import 'package:flutterdemoapp/utils/strings/string_constants_app.dart';
import 'package:google_fonts/google_fonts.dart';

class TopTownI extends StatelessWidget {
  final screenType;

  const TopTownI(this.screenType);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return Container(
        child: Text(
      StringConstants.textTop,
      textAlign: TextAlign.center,
      style: GoogleFonts.robotoSlab(
          fontSize: ScreenUtil(allowFontScaling: true).setSp(55),
          fontWeight: FontWeight.w700,
          color: AppColors.colorBlue),
    ));
  }
}
