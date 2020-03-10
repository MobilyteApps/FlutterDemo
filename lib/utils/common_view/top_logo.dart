import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopLogo extends StatelessWidget {
  final screenType;

  const TopLogo(this.screenType);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return SafeArea(
      top: true,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(30),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Center(
                  child: Image.asset(
                'assets/vector.png',
              ))),
        ],
      ),
    );
  }
}
