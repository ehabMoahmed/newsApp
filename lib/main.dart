import 'package:flutter/material.dart';
import 'package:newsapp/Shared/Theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Shared/provider/provider.dart';
import 'UI/home/home_screen.dart';
import 'UI/home/splash_screen.dart';
import 'UI/home/widget/article/article_list.dart';
import 'UI/home/widget/categories_widget.dart';
import 'UI/home/widget/categoy-details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


/* whenever your initialization is completed, remove the splash screen:
FlutterNativeSplash.remove();*/
void main() {

  runApp(ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingProvider provider=Provider.of<SettingProvider>(context);

    return MaterialApp(

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // arabic
      ],
      locale: Locale(provider.language),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  Apptheme.lightTheme,
      initialRoute:   SplashScreen.routeName,
      routes:{
        Articlee.routeName:(context) => Articlee( ),
        SplashScreen.routeName:(context) => SplashScreen(),
        HomeScreen.routeName:(context) => HomeScreen(),
        CategoryDetails.routeName:(context) => CategoryDetails(  ),
      },
    );
  }
}

