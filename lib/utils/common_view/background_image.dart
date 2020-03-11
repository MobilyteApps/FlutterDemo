import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemoapp/utils/colors/app_colors.dart';

class BackgroundImage extends StatelessWidget {
  final screenType;

  const BackgroundImage(this.screenType);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return SafeArea(
      top: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(
                  ScreenUtil.getInstance().setHeight(30), 0, ScreenUtil.getInstance().setHeight(30), 0),
              child: Container(
                  child: Center(
                      child: Image.asset(
                    screenType == 'signup'
                        ? 'assets/images/bg_fade.png' :
                    screenType == 'otp' || screenType == 'signin' ? 'assets/images/bg_black_white.png' //use faded image
                        : 'assets/images/bg.png',
                    color: AppColors.colorWhite.withOpacity(1.0),
                    colorBlendMode: BlendMode.softLight,
                  )))),
        ],
      ),
    );
  }
}
