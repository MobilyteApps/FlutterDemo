import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemoapp/utils/colors/app_colors.dart';
import 'package:flutterdemoapp/utils/common_view/background_image.dart';
import 'package:flutterdemoapp/utils/common_view/top_logo.dart';
import 'package:flutterdemoapp/utils/common_view/towni_text.dart';
import 'package:flutterdemoapp/utils/navigator/routes.dart';
import 'package:flutterdemoapp/utils/strings/string_constants_app.dart';
import 'package:google_fonts/google_fonts.dart';

class MagicScreen extends StatefulWidget {
  @override
  _MagicScreenState createState() => _MagicScreenState();
}

class _MagicScreenState extends State<MagicScreen> {
  bool linkSent = false; //if set false => show screen 1, else show screen 2(with home button)

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
      appBar: appbar(),
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
                  height: ScreenUtil.getInstance().setWidth(38),
                ),
                _magicLinkText(),
                !linkSent
                    ? SizedBox(
                        height: ScreenUtil.getInstance().setWidth(30),
                      )
                    : Container(),
                !linkSent ? _emailField() : Container(),
                _gradientHome(),
                SizedBox(
                  height: ScreenUtil.getInstance().setWidth(15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //top app bar view
  Widget appbar() {
    return AppBar(
      backgroundColor: AppColors.colorWhite,
      elevation: 0,
      leading: !linkSent
          ? Container(
              margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: new IconButton(
                icon: new Icon(Icons.arrow_back, color: AppColors.colorGrayOr),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          : Container(),
      title: Text(""),
      centerTitle: true,
    );
  }

  /*change view based on linkSent variable*/
  Widget _magicLinkText() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(30),
          ScreenUtil.getInstance().setHeight(50),
          ScreenUtil.getInstance().setHeight(30),
          ScreenUtil.getInstance().setHeight(23)),
      child: Text(
        !linkSent
            ? StringConstants.textMagicEnterEmail
            : StringConstants.textMagicLinkSent,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: ScreenUtil(allowFontScaling: true).setSp(16),
          color: AppColors.colorGrayVerify,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }


  /*enter email value*/
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


  /*change view of screen on tap*/
  Widget _gradientHome() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil.getInstance().setHeight(40),
          ScreenUtil.getInstance().setHeight(20),
          ScreenUtil.getInstance().setHeight(40),
          0),
      height: ScreenUtil.getInstance().setHeight(50),
      child: RaisedButton(
        onPressed: () {
          if(!linkSent) {
            setState(() {
              linkSent = true;
            });
          }else{
            Keys.navKey.currentState.pushReplacementNamed(Routes.landingUserScreen);
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
//              constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              !linkSent
                  ? StringConstants.textMagicLink
                  : StringConstants.textMagicHome,
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
