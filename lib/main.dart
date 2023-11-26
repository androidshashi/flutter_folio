import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/view/homepage.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeViewModel();
      },
      child: MaterialApp(
        title: 'Flutter Folio',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const HomePage(),
      ),
    );
  }
}
