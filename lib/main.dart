import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nada/db/db_helper.dart';
import 'package:nada/services/theme_services.dart';
import 'package:nada/ui/home_page.dart';
import 'package:nada/ui/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('===== Get.isDarkMode: ${Get.isDarkMode}');
    print('===== ThemeServices().theme: ${ThemeServices().theme}');
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset('images/splash.png'),
        nextScreen: const HomePage(),
        splashTransition: SplashTransition.fadeTransition ,
        backgroundColor: ThemeServices().theme == ThemeMode.dark ? Colors.black : Colors.white,
      ),
    );
  }
}
