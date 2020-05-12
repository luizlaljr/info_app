import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/home_controller.dart';

class ListCard extends StatelessWidget {
  final int index;

  const ListCard({Key key, this.index}) : super(key: key);

  HomeController get controller => Modular.get();

  @override
  Widget build(BuildContext context) {
    var mission = controller.missions.value[index];

    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1],
            colors: buildColors(mission.link),
          ),
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
                          fontSize: 18.0,
                        ),
                      )),
                  Icon(
                    buildIcon(mission.kind),
                    color: Colors.white,
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
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
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
                              color: Colors.yellowAccent,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0.0),
                            ),
                            Text(
                              mission.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.local_hotel,
                              color: Colors.yellowAccent,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0.0),
                            ),
                            Text(
                              mission.locale,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0.0),
                            ),
                            Icon(
                              Icons.airport_shuttle,
                              color: Colors.yellowAccent,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0.0),
                            ),
                            Text(
                              mission.transport.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(width: 30,),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Qtd.",
                              style: TextStyle(
                                color: Colors.yellowAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.0, vertical: 0.0),
                            ),
                            Text(
                              mission.amount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.attach_money,
                              color: Colors.yellowAccent,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.0, vertical: 0.0),
                            ),
                            Text(
                              mission.income.toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.white,
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
            trailing: Container(
              height: 50,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

IconData buildIcon(kind) {
  return kind == "OM" ? Icons.flight : Icons.insert_drive_file;
}

String buildLink(link) {
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

buildColors(link) {
  List<Color> colors = [];
  var colorBegin;
  var colorEnd;
  switch (link) {
    case "C":
      colorBegin = Colors.green[500];
      colorEnd = Colors.green[800];
      break;
    case "G":
      colorBegin = Colors.orange[500];
      colorEnd = Colors.orange[800];
      break;
    default:
      colorBegin = Colors.blue[500];
      colorEnd = Colors.blue[800];
  }
  colors.add(colorBegin);
  colors.add(colorEnd);
  return colors;
}
