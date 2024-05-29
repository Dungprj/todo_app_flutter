import "package:flutter/material.dart";
import 'package:ontapprovider_listviewbuilder/provider/mysetting.dart';

import 'package:provider/provider.dart';

import 'provider/sinhvien.dart';
import 'screen/Main.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PMysettings()),
      ChangeNotifierProvider(create: (_) => PSinhViens())
    ],
    child: MainScreen(),
  ));
}
