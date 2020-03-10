import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemoapp/utils/colors/app_colors.dart';
import 'package:flutterdemoapp/utils/common_view/background_image.dart';
import 'package:flutterdemoapp/utils/common_view/gradient_button_blue.dart';
import 'package:flutterdemoapp/utils/common_view/top_logo.dart';
import 'package:flutterdemoapp/utils/common_view/towni_text.dart';
import 'package:flutterdemoapp/utils/navigator/routes.dart';
import 'package:flutterdemoapp/utils/strings/string_constants_app.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBoxValue = false; //terms & condition unchecked by default

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                //top grouping
                Stack(
                  children: <Widget>[
                    BackgroundImage('signin'),
                    Column(
                      children: <Widget>[
                        TopLogo('signin'),
                        TopTownI('signin'),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: ScreenUtil.getInstance().setWidth(60),
                ),

                _emailField(),
                SizedBox(
                  height: ScreenUtil.getInstance().setWidth(27),
                ),
                _passwordField(),

                _forgotPassword(),

                GradientButtonBlue('signin', StringConstants.textLogin),

                SizedBox(
                  height: ScreenUtil.getInstance().setWidth(15),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    signInButtonGoogle(),
                    signInButtonFacebook()
                  ],
                ),

                _signUpText(),

                SizedBox(
                  height: ScreenUtil.getInstance().setWidth(50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*tap to sign in with google*/
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
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: AppColors.colorGrayStroke),
          ),
          elevation: 2,
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

  /*tap to signup with fB*/
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
            borderRadius: BorderRadius.circular(4.0),
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


  /*Enter email controller*/
  Widget _emailField() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(40),
          0,
          ScreenUtil.getInstance().setHeight(40),
          ScreenUtil.getInstance().setHeight(0)),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        cursorColor: AppColors.colorGray,
        maxLines: 1,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
          color: AppColors.colorGrayOr,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: StringConstants.textEmailHint,
          hintStyle: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
            color: AppColors.colorGrayOr,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorStrokeDark),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorStrokeDark),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorStrokeDark),
          ),
        ),
      ),
    );
  }


  /*enter password controller*/
  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(40),
          0,
          ScreenUtil.getInstance().setHeight(40),
          ScreenUtil.getInstance().setHeight(20)),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: AppColors.colorGray,
        maxLines: 1,
        obscureText: true,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
          color: AppColors.colorGrayOr,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: StringConstants.textPasswordHint,
          hintStyle: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
            color: AppColors.colorGrayOr,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorStrokeDark),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorStrokeDark),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorStrokeDark),
          ),
        ),
      ),
    );
  }


  /*tap here to sign up field*/
  Widget _signUpText() {
    return Container(
        margin: EdgeInsets.fromLTRB(
            ScreenUtil.getInstance().setHeight(0),
            ScreenUtil.getInstance().setHeight(0),
            ScreenUtil.getInstance().setHeight(0),
            ScreenUtil.getInstance().setHeight(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              StringConstants.textNoAccount,
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
                color: AppColors.colorGrayOr,
                fontWeight: FontWeight.w400,
              ),
            ),
            InkWell(
              onTap: () {
                Keys.navKey.currentState
                    .pushReplacementNamed(Routes.signUpScreen);
              },
              child: Text(
                StringConstants.textSignHere,
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.display1,
                  fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
                  color: AppColors.colorBlue,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ));
  }


  /*tap to navigate forgot password*/
  Widget _forgotPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(0),
          ScreenUtil.getInstance().setHeight(0),
          ScreenUtil.getInstance().setHeight(40),
          ScreenUtil.getInstance().setHeight(30)),
      child: Text(
        StringConstants.textForgotPassword,
        textAlign: TextAlign.end,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
          color: AppColors.colorBlue,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
