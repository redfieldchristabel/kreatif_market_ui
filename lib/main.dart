import 'package:flutter/material.dart';
import 'package:kretifmarketui/pages/Feed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static ValueNotifier<ThemeMode> mode = ValueNotifier<ThemeMode>(
      ThemeMode.light); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: mode,
        builder: (context, value, _) {
          return MaterialApp(
            title: 'Kreatif Media',
            themeMode: ThemeMode.system,
            theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
                primaryColor: Colors.white,
                accentColor: Colors.pinkAccent,
                // This makes the visual density adapt to the platform that you run
                // the app on. For desktop platforms, the controls will be smaller and
                // closer together (more dense) than on mobile platforms.
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: Brightness.light),
            darkTheme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: Colors.white,
                accentColor: Colors.pinkAccent,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: Brightness.dark),
            home: Feed(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
