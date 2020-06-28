import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/manager_controller.dart';
import 'package:info_app/app/modules/manager/shared/models/manager_model.dart';
import 'package:info_app/app/shared/utils/formatter.dart';

class ListCard extends StatelessWidget {
  final int index;

  const ListCard({Key key, this.index}) : super(key: key);

  ManagerController get controller => Modular.get();

  @override
  Widget build(BuildContext context) {
    ManagerModel manager = controller.manager.value[index];
    final iconSize = 18.0;

    return Card(
      elevation: 8.0,
      color: Colors.white54,
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.6],
              colors: [
                Color(0xFF2E4C6E),
                Color(0xFF1C2C43),
              ],
            ),
            //borderRadius: BorderRadius.circular(30),
          ),
          height: 90,
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 3.0,
                    color: Colors.white70,
                  ),
                ),
              ),
              child: Icon(
                buildIcon(manager.condition),
                color: buildColor(manager.condition),
                size: 36,
              ),
            ),
            title: Text(
              manager.post + " " + manager.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: 6),
            ),
            subtitle: Container(
              height: 50,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.today,
                                color: buildColor(manager.condition),
                                size: iconSize,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 0.0),
                              ),
                              Text(
                                Formatter.date(manager.dateCondition),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: buildColor(manager.condition),
                                size: iconSize,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 0.0),
                              ),
                              Text(
                                buildActivity(manager.activity),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 0.0),
                              ),
                              Icon(
                                Icons.label_important,
                                color: buildColor(manager.condition),
                                size: iconSize,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 0.0),
                              ),
                              Text(
                                manager.operationality,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 30,
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.flight,
                                color: buildColor(manager.condition),
                                size: iconSize,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.0, vertical: 0.0),
                              ),
                              Text(
                                manager.project,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.timelapse,
                                color: buildColor(manager.condition),
                                size: 18,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.0, vertical: 0.0),
                              ),
                              Text(
                                buildAmount(manager.condition, manager.amount),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Color buildColor(bool condition) {
  return condition ? Colors.lightGreenAccent : Colors.lightBlueAccent;
}

IconData buildIcon(bool condition) {
  return condition ? Icons.copyright : Icons.monetization_on;
}

String buildAmount(bool condition, num amount) {
  return condition ? amount.toStringAsFixed(0) : amount.toString();
}

String buildActivity(String activity) {
  var text;
  switch (activity) {
    case 'P':
      text = 'PIL';
      break;
    case 'M':
      text = 'MEC';
      break;
    case 'D':
      text = 'DOC';
      break;
    default:
      text = 'COM';
  }
  return text;
}
