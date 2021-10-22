import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nada/services/notification_services.dart';
import 'package:nada/services/theme_services.dart';
import 'package:nada/ui/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      appBar: _appBar(),
      body: Column(
        children: [
          Text(
            'Theme Data',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();

          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Light Theme"
                  : "Activated Dark Theme");

          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Image.asset(
            'images/profile.png',
            height: 20,
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
