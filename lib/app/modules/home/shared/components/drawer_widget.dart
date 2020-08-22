import 'package:flutter/material.dart';
import 'package:info_app/app/modules/home/shared/components/drawer_date_widget.dart';
import 'package:info_app/app/modules/home/shared/components/drawer_kind_widget.dart';
import 'package:info_app/app/modules/home/shared/components/drawer_locale_widget.dart';
import 'package:info_app/app/modules/home/shared/components/drawer_number_widget.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: Color(0xFF12365A),
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Filtros",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                Divider(
                  height: 4.0,
                  color: Colors.white,
                  thickness: 0.5,
                ),
                Divider(
                  height: 4.0,
                  color: Colors.white,
                  thickness: 0.5,
                ),
                Expanded(
                  flex: 3,
                  child: ListView(
                    children: <Widget>[
                      DrawerKindWidget(title: "Tipos"),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      DrawerNumberWidget(title: "Número:"),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      DrawerLocaleWidget(title: "Localidade:"),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      DrawerDateWidget(title: "Data:"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 35,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.1, 1],
                            colors: [
                              Color(0xFF4782FB),
                              Color(0xFF00E6FD),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: FlatButton(
                          child: Text(
                            'OK',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textColor: Colors.white,
                          onPressed: Navigator.of(context).pop,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
