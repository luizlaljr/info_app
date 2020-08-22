import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/shared/models/user_model.dart';
import 'package:info_app/app/modules/status/status_controller.dart';
import 'package:info_app/app/shared/utils/formatter.dart';

class BuildInfoContainerWidget extends StatelessWidget {
  final StatusController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final UserModel user = controller.user.value;
    final textSize = 12.0;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Divider(
              color: Color(0xFF6286AA),
              thickness: 3.5,
              height: 0.5,
            ),
            Divider(
              color: Colors.grey[100],
              thickness: 1,
              height: 5.0,
            ),
            Container(
              height: 18,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Situação:",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: textSize,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    buildConditionText(user.condition),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: textSize),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            Container(
              height: 18,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Data Inicial:",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: textSize,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    Formatter.date(user.dateCondition),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: textSize),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            Container(
              height: 18,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Módulo:",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: textSize,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                   'Não',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: textSize),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            Container(
              height: 18,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Documento:",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: textSize,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    user.document == "" ? "N/A" : user.document,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: textSize),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[100],
              thickness: 1,
              height: 8,
            ),
            Divider(
              color: Color(0xFF6286AA),
              thickness: 3.5,
              height: 1.7,
            ),
          ],
        ),
      ),
    );
  }
}

String buildConditionText(condition) {
  return condition ? "Comissionado" : "Diária";
}
