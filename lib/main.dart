import 'package:flutter/material.dart';
import 'package:fore_cast/screens/city_screen.dart';
import 'package:fore_cast/screens/loading_screen.dart';
import 'package:fore_cast/screens/location_screen.dart';

void main() => runApp(ForeCast());

class ForeCast extends StatelessWidget {
  const ForeCast({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData.dark().copyWith(
       scaffoldBackgroundColor: Color(0xFF0E0430),
       textTheme: TextTheme(
         bodyMedium: TextStyle(
           color: Color(0xFFBBD6FD),
           fontFamily: 'Poppins'
         ),
       ),
     ),
      home: LoadingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
