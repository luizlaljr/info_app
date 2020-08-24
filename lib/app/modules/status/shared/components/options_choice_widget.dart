import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/shared/models/user_model.dart';
import 'package:info_app/app/modules/status/status_controller.dart';

class OptionsChoiceWidget extends StatelessWidget {
  final StatusController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    UserModel user = controller.user.value;
    List<String> imageList = ['w', 'm', 'mm', 'mmm'];
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.47,
          width: MediaQuery.of(context).size.width * 0.86,
          decoration: BoxDecoration(
            color: Color(0xFF22466A),
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: Color(0xFF6286AA),
              width: 3.0,
            ),
          ),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Wrap(
                      children: List.generate(imageList.length, (index) {
                    return FlatButton(
                      padding: EdgeInsets.all(10),
                      onPressed: () => {
                        controller.setSkin(imageList[index]),
                        Navigator.of(context).pop(),
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.32,
                        height: MediaQuery.of(context).size.width * 0.30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(buildProfileImage(
                                user.sex, user.activity, imageList[index])),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                            color: Color(0xFF6286AA),
                            width: 6.0,
                          ),
                        ),
                      ),
                    );
                  })),
                ),
              ],
            ),
          ), // FlatButton
        ),
      ),
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
