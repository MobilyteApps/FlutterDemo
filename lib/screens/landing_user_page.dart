import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemoapp/utils/colors/app_colors.dart';
import 'package:flutterdemoapp/utils/common_view/background_image.dart';
import 'package:flutterdemoapp/utils/common_view/gradient_button_blue.dart';
import 'package:flutterdemoapp/utils/common_view/gradient_button_green.dart';
import 'package:flutterdemoapp/utils/common_view/top_logo.dart';
import 'package:flutterdemoapp/utils/common_view/towni_text.dart';
import 'package:flutterdemoapp/utils/navigator/routes.dart';
import 'package:flutterdemoapp/utils/strings/string_constants_app.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingUserScreen extends StatefulWidget {
  @override
  _LandingUserScreenState createState() => _LandingUserScreenState();
}

class _LandingUserScreenState extends State<LandingUserScreen> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: AppColors.colorWhite,
      body:
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              TopLogo('login'),
              TopTownI('login'),

              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setWidth(20)),
                child: BackgroundImage('login'),
              ),

              SizedBox(
                height: ScreenUtil.getInstance().setWidth(48),
              ),

              GradientButtonBlue('login', StringConstants.textLogin),  //tap to navigate to login

              SizedBox(
                height: ScreenUtil.getInstance().setWidth(23),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  signInButtonGoogle(),  //tap to navigate to sign up page
                  signInButtonFacebook()
                ],
              ),

              SizedBox(
                height: ScreenUtil.getInstance().setWidth(22),
              ),

              GradientButtonGreen('login', StringConstants.textSignUp)  //tap to move to sign up page
            ],
          ),
        ),
      ),
    );
  }


  /*Sign in with google*/
  Widget signInButtonGoogle() {
    return Expanded(
      child: Container(
        height: ScreenUtil.getInstance().setHeight(50),
        width: ScreenUtil.getInstance().setHeight(240),
        margin: EdgeInsets.fromLTRB(
            ScreenUtil.getInstance().setHeight(40),
            ScreenUtil.getInstance().setHeight(23),
            ScreenUtil.getInstance().setHeight(10),
            ScreenUtil.getInstance().setHeight(22)),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: AppColors.colorGrayStroke),
          ),
          onPressed: () {
            Keys.navKey.currentState.pushReplacementNamed(Routes.signUpScreen);
          },
          color: AppColors.colorWhite,
          textColor: AppColors.colorGrayOr,
          child: Row(
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage(
                    "assets/google_logo.png",
                  ),
                  height: 18.0,
                  width: 18.0,
                ),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    StringConstants.textGoogle,
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
                      color: AppColors.colorGrayOr,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  /*Sign in with facebook*/
  Widget signInButtonFacebook() {
    return Expanded(
      child: Container(
        height: ScreenUtil.getInstance().setHeight(50),
        width: ScreenUtil.getInstance().setHeight(240),
        margin: EdgeInsets.fromLTRB(
            ScreenUtil.getInstance().setHeight(10),
            ScreenUtil.getInstance().setHeight(23),
            ScreenUtil.getInstance().setHeight(40),
            ScreenUtil.getInstance().setHeight(22)),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: AppColors.colorGrayStroke),
          ),
          onPressed: () {
            Keys.navKey.currentState.pushReplacementNamed(Routes.signUpScreen);
          },
          color: AppColors.colorWhite,
          textColor: AppColors.colorGrayOr,
          child: Row(
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage(
                    "assets/facebook.png",
                  ),
                  height: 18.0,
                  width: 18.0,
                ),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    StringConstants.textFacebook,
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
                      color: AppColors.colorGrayOr,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
