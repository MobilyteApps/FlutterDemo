import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemoapp/utils/colors/app_colors.dart';
import 'package:flutterdemoapp/utils/common_view/background_image.dart';
import 'package:flutterdemoapp/utils/common_view/gradient_button_green.dart';
import 'package:flutterdemoapp/utils/common_view/top_logo.dart';
import 'package:flutterdemoapp/utils/common_view/towni_text.dart';
import 'package:flutterdemoapp/utils/strings/string_constants_app.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                Stack(
                  children: <Widget>[
                    BackgroundImage('signup'),
                    Column(
                      children: <Widget>[
                        TopLogo('signup'),
                        TopTownI('signup'),
                      ],
                    ),
                  ],
                ),

                _fullNameField(),

                _emailField(),

                _phoneField(),

                _passwordField(),
                GradientButtonGreen('signup', StringConstants.textSignUp),

                checkBox(),
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

  /*google sign in*/
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
            FocusScope.of(context).unfocus();
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


//  facebook sign in
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
            FocusScope.of(context).unfocus();
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

  /*Enter full name*/
  Widget _fullNameField() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(40),
          0,
          ScreenUtil.getInstance().setHeight(40),
          ScreenUtil.getInstance().setHeight(40)),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.colorGray,
        maxLines: 1,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
          color: AppColors.colorGrayOr,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: StringConstants.textFullNameHint,
          hintStyle: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
            color: AppColors.colorGrayOr,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
        ),
      ),
    );
  }

  /*Fill email address*/
  Widget _emailField() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(40),
          0,
          ScreenUtil.getInstance().setHeight(40),
          ScreenUtil.getInstance().setHeight(40)),
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
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
        ),
      ),
    );
  }

  /*fill mobile number*/
  Widget _phoneField() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(40),
          0,
          ScreenUtil.getInstance().setHeight(40),
          ScreenUtil.getInstance().setHeight(40)),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        cursorColor: AppColors.colorGray,
        maxLines: 1,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
          color: AppColors.colorGrayOr,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: StringConstants.textMobileHint,
          hintStyle: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
            color: AppColors.colorGrayOr,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
        ),
      ),
    );
  }

  /*enter password == obscured*/
  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(40),
          0,
          ScreenUtil.getInstance().setHeight(40),
          ScreenUtil.getInstance().setHeight(50)),
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
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGrayStroke),
          ),
        ),
      ),
    );
  }

  /*accept t&c currently its off*/
  Widget checkBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Checkbox(
              value: checkBoxValue,
              activeColor: AppColors.colorGreenAccent,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
                //  Text('Remember me');
              }),
        ),
        Row(
          children: <Widget>[
            Text(
              StringConstants.textAccept,
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
                color: AppColors.colorGrayOr,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              StringConstants.textAgreeTerms,
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
                color: AppColors.colorBlue,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        )
      ],
    );
  }
}
