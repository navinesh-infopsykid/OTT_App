import 'package:Zera/splash%20screen.dart';
import 'package:Zera/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';




import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';





import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'package:substring_highlight/substring_highlight.dart';

import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseApi().initialnotifications();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {


  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  bool ison = false;

  @override
  Widget build(BuildContext context)
  {
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child)
    {
      return MaterialApp(
        title: 'Navi works',
        debugShowCheckedModeBanner: false,
        theme: themeNotifier.isDark ? darktheme : lighttheme,

        home: splash(),
        builder: (context, index) =>
            ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, index!),
              maxWidth: 1200,
              minWidth: 450,

              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
                const ResponsiveBreakpoint.resize(450, name: TABLET),
                const ResponsiveBreakpoint.autoScale(450, name: TABLET),
                const ResponsiveBreakpoint.resize(450, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(450, name: DESKTOP),
              ],
            ),

      );
    }));
  }
}
