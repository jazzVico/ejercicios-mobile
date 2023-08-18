import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integrador/extensions/themes.dart';
import 'package:integrador/pages/home.dart';
import 'package:integrador/pages/splash.dart';

import 'pages/navigation.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themes(),
      home: Splash(child: HomePage()),
      onGenerateRoute: Navigation.onGenerateRoute,
    );
  }
}


