import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/view/homepage.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:flutter_folio/view_model/mousee_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeViewModel()),
          ChangeNotifierProvider(create: (context) => MouseViewModel()),
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Folio',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
                useMaterial3: true,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            home: MouseRegion(
              onHover: (event) {
                Provider.of<MouseViewModel>(context, listen: false)
                    .updateMousePosition(event.position);
              },
              child: Selector<MouseViewModel, Offset>(
                selector: (p0, p1) => p1.ballPosition,
                child: const HomePage(),
                builder: (context, position, child) => Stack(
                  children: [
                    child!,
                    // Tech-themed ball
                    Positioned(
                      left: position.dx - 10,
                      top: position.dy - 10,
                      child: IgnorePointer(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 50),
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors
                                .teal, // Ensure the ball has a visible color
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
