import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nada/ui/themes.dart';

class NotifiedPage extends StatelessWidget {
  final String? label;

  const NotifiedPage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Container(
            child: Column(children: [
              Text(
                "Hello !",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You have a new reminder",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
              margin: const EdgeInsets.only(left: 30, right: 30),
              //child:Text('${_payload}'),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.text_format, size: 35, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Title",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      this.label.toString().split("|")[0],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.description, size: 35, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      this.label.toString().split("|")[1],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_rounded,
                            size: 35, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Time",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      this.label.toString().split("|")[2],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ]),
              decoration: BoxDecoration(
                  color: _getBGClr(int.parse(label.toString().split("|")[3])),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
            ),
          ),
          SizedBox(
            height: 140,
          )
        ]),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return yellowClr;
      default:
        return bluishClr;
    }
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
