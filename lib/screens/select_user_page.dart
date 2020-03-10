import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemoapp/utils/colors/app_colors.dart';
import 'package:flutterdemoapp/utils/common_view/background_image.dart';
import 'package:flutterdemoapp/utils/common_view/gradient_button_blue.dart';
import 'package:flutterdemoapp/utils/common_view/gradient_button_green.dart';
import 'package:flutterdemoapp/utils/common_view/top_logo.dart';
import 'package:flutterdemoapp/utils/common_view/towni_text.dart';
import 'package:flutterdemoapp/utils/strings/string_constants_app.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectUserScreen extends StatefulWidget {
  @override
  _SelectUserScreenState createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              TopLogo('signupv2'),
              TopTownI('signupv2'),
              SizedBox(
                height: ScreenUtil.getInstance().setWidth(20),
              ),
              _smartWayText(), //text fields
              _smartCityText(),  //text field
              SizedBox(
                height: ScreenUtil.getInstance().setWidth(18),
              ),
              BackgroundImage('signupv2'),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(20),
              ),
              GradientButtonBlue('signupv2', StringConstants.textResident), //user type button
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(10),
              ),
              _orDivider(),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(10),
              ),
              GradientButtonGreen('signupv2', StringConstants.textVisitor) //user type button
            ],
          ),
        ),
      ),
    );
  }


  /*text field view*/
  Widget _smartWayText() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Center(
          child: Text(
            StringConstants.textSmartSolution.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(18),
              color: AppColors.colorBlackLight,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }

  /*text field view*/
  Widget _smartCityText() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Center(
          child: Text(
            StringConstants.textSmartCities.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(18),
              color: AppColors.colorBlackLight,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }


  /*or text field with divider*/
  Widget _orDivider() {
    return Container(
        margin: EdgeInsets.fromLTRB(
            ScreenUtil.getInstance().setHeight(40),
            ScreenUtil.getInstance().setHeight(0),
            ScreenUtil.getInstance().setHeight(40),
            0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: Divider(
                    color: AppColors.colorGrayStroke,
                    height: 50,
                  )),
            ),
            _orText(),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: Divider(
                    color: AppColors.colorGrayStroke,
                    height: 50,
                  )),
            ),
          ],
        ));
  }


  /*OR text field*/
  Widget _orText() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: MediaQuery.of(context).size.width * 0.10,
        height: MediaQuery.of(context).size.width * 0.10,
        child: Center(
          child: Text(
            StringConstants.textOr,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(14),
              color: AppColors.colorGrayOr,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }
}
