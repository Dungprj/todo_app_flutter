import 'package:flutter/material.dart';
import 'package:ontapprovider_listviewbuilder/provider/mysetting.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quan ly sinh vien",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: context.watch<PMysettings>().isDark
            ? Brightness.dark
            : Brightness.light,
      ),
      home: Home(),
    );
  }
}
