import 'package:flutter/material.dart';
import 'package:info_app/app/modules/manager/shared/components/drawer_activity_widget.dart';
import 'package:info_app/app/modules/manager/shared/components/drawer_amount_widget.dart';
import 'package:info_app/app/modules/manager/shared/components/drawer_condition_widget.dart';
import 'package:info_app/app/modules/manager/shared/components/drawer_modulus_widget.dart';
import 'package:info_app/app/modules/manager/shared/components/drawer_operationality_widget.dart';
import 'package:info_app/app/modules/manager/shared/components/drawer_project_widget.dart';

import 'drawer_name_widget.dart';

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
                  flex: 4,
                  child: ListView(
                    children: <Widget>[
                      DrawerNameWidget(title: "Nome"),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      DrawerConditionWidget(title: "Condição"),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      DrawerModulusWidget(title: "Módulo"),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      DrawerAmountWidget(title: "Qtd:"),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      DrawerProjectWidget(title: "Projeto"),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      DrawerActivityWidget(title: "Função"),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      DrawerOperationalityWidget(title: "Operacionalidade"),
                      Divider(
                        height: 4.0,
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
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
