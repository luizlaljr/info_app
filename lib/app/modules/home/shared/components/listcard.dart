import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/home_controller.dart';
import 'package:info_app/app/modules/home/shared/models/mission_model.dart';
import 'package:info_app/app/shared/utils/formatter.dart';

class ListCard extends StatelessWidget {
  final int index;
  final List<MissionModel> missionsList;

  const ListCard({Key key, this.index, this.missionsList}) : super(key: key);

  HomeController get controller => Modular.get();

  @override
  Widget build(BuildContext context) {
    final mission = missionsList[index];
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
          height: 100,
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
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        mission.number,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: mission.number.length < 6 ? 14.0 : 9.0,
                        ),
                      )),
                  Icon(
                    buildIcon(mission.kind),
                    color: buildIconColor(mission.link),
                    size: 25,
                  ),
                ],
              ),
            ),
            title: Text(
              buildLink(mission.link),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: 6),
            ),
            subtitle: Column(
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
                              Icons.flight_takeoff,
                              color: buildIconColor(mission.link),
                              size: iconSize,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0.0),
                            ),
                            Text(
                              Formatter.date(mission.start),
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
                              Icons.local_hotel,
                              color: buildIconColor(mission.link),
                              size: iconSize,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0.0),
                            ),
                            Text(
                              mission.locale,
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
                              Icons.airport_shuttle,
                              color: buildIconColor(mission.link),
                              size: iconSize,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0.0),
                            ),
                            Text(
                              mission.transport.toString(),
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
                            Text(
                              "Qtd.",
                              style: TextStyle(
                                color: buildIconColor(mission.link),
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.0, vertical: 0.0),
                            ),
                            Text(
                              buildAmount(mission.link, mission.amount),
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
                              Icons.attach_money,
                              color: buildIconColor(mission.link),
                              size: 18,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.0, vertical: 0.0),
                            ),
                            Text(
                              Formatter.money(mission.link == 'G' ? mission.amount * mission.wage / 100 : mission.income),
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
    );
  }
}

Color buildIconColor(link) {
  var color;
  switch (link) {
    case "C":
      color = Colors.lightGreenAccent;
      break;
    case "G":
      color = Colors.amberAccent[400];
      break;
    default:
      color = Colors.lightBlueAccent;
  }
  return color;
}

IconData buildIcon(String kind) {
  return kind == "OM" ? Icons.flight : Icons.insert_drive_file;
}

String buildLink(String link) {
  var text;
  switch (link) {
    case "C":
      text = "Comissionado";
      break;
    case "G":
      text = "Grat Rep";
      break;
    default:
      text = "Diária";
  }
  return text;
}

String buildAmount(String link, num amount) {
  var text;
  switch (link) {
    case "C":
      text = amount.toStringAsFixed(0);
      break;
    case "G":
      text = amount.toString() + '%';
      break;
    default:
      text = amount.toString();
  }
  return text;
}
