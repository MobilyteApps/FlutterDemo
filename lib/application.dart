import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemoapp/providers/models/theme_model.dart';
import 'package:flutterdemoapp/screens/login_page.dart';
import 'package:flutterdemoapp/screens/magic_page.dart';
import 'package:flutterdemoapp/screens/select_user_page.dart';
import 'package:flutterdemoapp/screens/landing_user_page.dart';
import 'package:flutterdemoapp/screens/sign_up_page.dart';
import 'package:flutterdemoapp/screens/verification_page.dart';
import 'package:flutterdemoapp/utils/colors/app_colors.dart';
import 'package:flutterdemoapp/utils/navigator/routes.dart';
import 'package:provider/provider.dart';


class ApplicationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()), //init provider(to set theme throughout app)
      ],
      child: DemoApp(),
    );
  }
}

class DemoApp extends StatelessWidget {
  final String appName = 'Demo App'; //app name

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: AppColors.colorWhite,
        title: appName,
        navigatorKey: Keys.navKey,  //app navigator key(init here)....
        debugShowCheckedModeBanner: false,
        home: SelectUserScreen(),         //home screen
        theme: Provider.of<ThemeModel>(context).data, //set theme for app

        //define routes for application.......
        routes: <String, WidgetBuilder>{
          Routes.landingUserScreen: (context) {
            //landing screen - select login or sign up
            return LandingUserScreen();
          },
          Routes.signUpScreen: (context) {
            //sign up screen
            return SignUpScreen();
          },
          Routes.verificationScreen: (context) {
            //verify otp here
            return VerificationScreen();
          },
          Routes.signInScreen: (context) {
            //sign in user
            return LoginScreen();
          },
          Routes.magicScreen: (context) {
            //magic link sent screen
            return MagicScreen();
          },
        }
    );
  }
}