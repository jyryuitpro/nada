import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nada/ui/themes.dart';
import 'package:nada/ui/widgets/my_input_filed.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: headingTextStyle,
              ),
              MyInputField(
                title: 'Title',
                hint: 'Enter your title',
              ),
              MyInputField(
                title: 'Note',
                hint: 'Enter your note',
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back,
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
            width: 20,
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
