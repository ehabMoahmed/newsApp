import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../Shared/provider/provider.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>

    with SingleTickerProviderStateMixin
{

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode( SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5),()
    {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder:  (context) =>HomeScreen() ));

    });
  }

  /*
  void dispose(){
    SystemChrome.setEnabledSystemUIMode( SystemUiMode.manual,
    overlays: SystemUiOverlay.values);

  }*/



  @override
  Widget build(BuildContext context) {
    SettingProvider provider=Provider.of(context);
    return Scaffold(
      body: Container(

        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image:  AssetImage(
                "asset/images/splash.jpg" ),

            ),color: Colors.white
        ),
      ),
    );
  }
}
