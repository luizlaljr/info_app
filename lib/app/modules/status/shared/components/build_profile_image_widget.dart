import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/shared/components/options_choice_widget.dart';
import 'package:info_app/app/modules/status/shared/models/user_model.dart';
import 'package:info_app/app/modules/status/status_controller.dart';

class BuildProfileImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatusController controller = Modular.get();

    UserModel user = controller.user.value;
    
    return Observer(
      builder: (_) {
        String skin = controller.userSkin.value;
        if (controller.userSkin.value == null) {
          return Center(
            child: Container(
              child: CircularProgressIndicator(),
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(80.0),
                border: Border.all(
                  color: Color(0xFF6286AA),
                  width: 6.0,
                ),
              ),
            ),
          );
        }
        return Center(
          child: Container(
            child: IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white70,
              ),
              padding: EdgeInsets.only(
                top: 30,
                left: 100,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  // We will now use PageRouteBuilder
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, a, __) {
                      return OptionsChoiceWidget();
                    },
                  ),
                ); // PageRouteBuilder
              },
            ),
            width: 140.0,
            height: 140.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  buildProfileImage(user.sex, user.activity, skin),
                ),
                fit: BoxFit.cover,
              ),
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(80.0),
              border: Border.all(
                color: Color(0xFF6286AA),
                width: 6.0,
              ),
            ),
          ),
        );
      },
    );
  }
}

String buildProfileImage(String sex, String activity, String skin) {
  String text;
  String prefix;
  String main;
  String suffix = skin;
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
      main = 'pilot';
      break;
    case "M":
      main = 'mechanic';
      break;
    case "C":
      main = 'attendant';
      break;
    case "D":
      main = 'doctor';
      break;
  }
  text = 'assets/images/$prefix-$main-$suffix.png';
  return text;
}
