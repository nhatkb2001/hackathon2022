import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import views
import 'views/wrapper/onboardingWrapper.dart';
import 'views/wrapper/authenticationWrapper.dart';

//import provider - state management
import 'package:provider/provider.dart';

//import others
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

int initScreen = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = (preferences.getInt('initScreen') ?? 0);
  await preferences.setInt('initScreen', 1);
  runApp(EcolourApp());
}

class EcolourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecolour',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        // const Locale('vn', 'VN'), // VietNam
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        primarySwatch: Colors.grey,
        cardColor: Colors.white70,
        accentColor: Colors.white,
      ),
      initialRoute:
          initScreen == 0 || initScreen == null ? 'onboarding' : 'auth',
      routes: {
        'onboarding': (context) => onboardingWrapper(),
        'auth': (context) => authenticationWrapper(),
      },
    );
  }
}
