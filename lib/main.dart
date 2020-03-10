import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemoapp/providers/prefs_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'application.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize to init theme
  PrefsSingleton.prefs = await SharedPreferences.getInstance();


  //run main function after setting orientation to Portrait..
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ApplicationApp()); //Main class to store functions for app
  });

}


