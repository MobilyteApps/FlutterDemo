import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemoapp/utils/colors/app_colors.dart';
import 'package:flutterdemoapp/utils/navigator/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButtonBlue extends StatelessWidget {
  final screenType;
  final String textToShow;

  const GradientButtonBlue(this.screenType, this.textToShow);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(40),
          ScreenUtil.getInstance().setHeight(20),
          ScreenUtil.getInstance().setHeight(40),
          0),
      height: ScreenUtil.getInstance().setHeight(60),
      child: RaisedButton(
        onPressed: () {
          if (screenType == 'signupv2') {
            Keys.navKey.currentState
                .pushReplacementNamed(Routes.landingUserScreen);  //after select user navigate to landing
            return;
          }
          if (screenType == 'login') {
            Keys.navKey.currentState.pushReplacementNamed(Routes.signInScreen);
            return;
          }
          if (screenType == 'otp') {
            Keys.navKey.currentState.pushReplacementNamed(Routes.signInScreen);
            return;
          }
          if (screenType == 'signin') {
            Keys.navKey.currentState.pushNamed(Routes.magicScreen);
            return;
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.colorBlueLightGrad,
                  AppColors.colorBlueDarkGrad
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(4.0)),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              textToShow,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
                color: AppColors.colorWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
