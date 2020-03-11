import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemoapp/utils/colors/app_colors.dart';
import 'package:flutterdemoapp/utils/common_view/background_image.dart';
import 'package:flutterdemoapp/utils/common_view/gradient_button_blue.dart';
import 'package:flutterdemoapp/utils/common_view/top_logo.dart';
import 'package:flutterdemoapp/utils/strings/string_constants_app.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

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
                    BackgroundImage('otp'),
                    TopLogo('otp'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      ScreenUtil.getInstance().setHeight(30),
                      ScreenUtil.getInstance().setHeight(20),
                      ScreenUtil.getInstance().setHeight(30),
                      ScreenUtil.getInstance().setHeight(22)),
                  child: Text(
                    StringConstants.texCodeSend,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(16),
                      color: AppColors.colorGrayVerify,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                otpFields(),
                GradientButtonBlue('otp', StringConstants.textLogin),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Returns "Otp custom text field"
  Widget otpFields() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//            ..._listOTPField.map((item) => otpDigitOne(item)).toList(),
                otpDigitOne(''),
                otpDigitOne(''),
                otpDigitOne(''),
                otpDigitOne('')
              ],
            ),
          ),
          _digitCode(),
          _resendCode()
        ],
      ),
    );
  }

  /*Enter OTP value */
  Widget otpDigitOne(String digit) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 40,
      child: TextFormField(
        autofocus: false,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.black12,
        cursorWidth: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        onChanged: (v) {},
      ),
    );
  }

  /*4 digit text field*/
  Widget _digitCode() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(0),
          ScreenUtil.getInstance().setHeight(10),
          ScreenUtil.getInstance().setHeight(0),
          ScreenUtil.getInstance().setHeight(23)),
      child: Text(
        StringConstants.textDigit,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
          color: AppColors.colorBlackVerify,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  /*tap to resend code*/
  Widget _resendCode() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(0),
          ScreenUtil.getInstance().setHeight(0),
          ScreenUtil.getInstance().setHeight(0),
          ScreenUtil.getInstance().setHeight(30)),
      child: Text(
        StringConstants.textResendCode,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
          color: AppColors.colorBlue,
          fontWeight: FontWeight.w400,
        ).copyWith(decoration: TextDecoration.underline),
      ),
    );
  }
}
