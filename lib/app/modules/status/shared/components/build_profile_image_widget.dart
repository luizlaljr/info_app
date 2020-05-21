import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/status_controller.dart';

class BuildProfileImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatusController controller = Modular.get();

    var user = controller.user.value;
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(buildProfileImage(user.sex, user.activity)),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.blue[300],
            width: 6.0,
          ),
        ),
      ),
    );
  }
}

String buildProfileImage(String sex, String activity) {
  var text;
  var prefix;
  var sufix;
  switch (sex) {
    case "M":
      prefix = 'man';
      break;
    case "F":
      prefix = 'woman';
      break;
  }
  switch (activity) {
    case "P":
      sufix = 'pilot';
      break;
    case "M":
      sufix = 'mechanic';
      break;
    case "C":
      sufix = 'attendant';
      break;
  }
  text = 'assets/images/$prefix-$sufix.png';
  return text;
}
