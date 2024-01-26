import 'package:architecture_getx/module/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/colors.dart';
import 'core/utils/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await dep.init();
  await Future.delayed(const Duration(milliseconds: 300));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Appabc@gmail.com 123456',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: secondaryColor,
            ),
      ),
      home: HomeScreen(),
      // initialRoute: AppRoutes.splashScreen,
      // getPages: AppRoutes.routes,
    );
  }
}
