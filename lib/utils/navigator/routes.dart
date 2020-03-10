import 'package:flutter/cupertino.dart';



//define key used to navigate to routes...to be used globally
class Keys {
  static final navKey =  GlobalKey<NavigatorState>();
}


//define all classes routes/screens here......
class Routes {
  static final landingUserScreen           = "/LandingUserScreen";
  static final signUpScreen                = "/SignUpScreen";
  static final verificationScreen          = "/VerificationScreen";
  static final signInScreen                = "/LoginScreen";
  static final magicScreen                 = "/MagicScreen";
}