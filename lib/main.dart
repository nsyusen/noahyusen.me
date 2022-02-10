import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noah Yusen',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50)
            )
          ),
          color: primaryColor,
          titleTextStyle: GoogleFonts.rubik(
            color: Colors.white,
            fontSize: 25
          )
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: primaryColor,
        ),
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: textColor,
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        primaryColor: primaryColor
      ),
      home: HomeScreen(),
    );
  }
}
