import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/status_controller.dart';
import 'package:info_app/app/shared/utils/formatter.dart';

class BuildInfoContainerWidget extends StatelessWidget {
  final StatusController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final user = controller.user.value;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Divider(
              color: Colors.cyan[200],
              thickness: 3.5,
              height: 0.5,
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
              height: 5.0,
            ),
            Container(
              height: 20,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Situação:",
                    style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    buildConditionText(user.condition),
                    style: TextStyle(
                        color: Colors.indigo[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            Container(
              height: 20,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Data Inicial:",
                    style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    Formatter.date(user.dateCondition),
                    style: TextStyle(
                        color: Colors.indigo[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            Container(
              height: 20,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Documento:",
                    style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    user.document,
                    style: TextStyle(
                        color: Colors.indigo[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
              height: 9,
            ),
            Divider(
              color: Colors.cyan[200],
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
