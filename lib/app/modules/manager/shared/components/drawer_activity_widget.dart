import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/manager_controller.dart';

class DrawerActivityWidget extends StatelessWidget {
  final String title;

  const DrawerActivityWidget({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ManagerController _controller = Modular.get();
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Observer(builder: (_) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.white54),
                            child: Checkbox(
                              autofocus: false,
                              tristate: false,
                              value: _controller.checkboxPilot,
                              onChanged: _controller.setCheckboxPilot,
                            ),
                          ),
                          Text(
                            "PIL",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0.0),
                          ),
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.white54),
                            child: Checkbox(
                              autofocus: false,
                              tristate: false,
                              value: _controller.checkboxMechanic,
                              onChanged: _controller.setCheckboxMechanic,
                            ),
                          ),
                          Text(
                            "MEC",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.white54),
                            child: Checkbox(
                              autofocus: false,
                              tristate: false,
                              value: _controller.checkboxAttendant,
                              onChanged: _controller.setCheckboxAttendant,
                            ),
                          ),
                          Text(
                            "COM",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0.0),
                          ),
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.white54),
                            child: Checkbox(
                              autofocus: false,
                              tristate: false,
                              value: _controller.checkboxDoctor,
                              onChanged: _controller.setCheckboxDoctor,
                            ),
                          ),
                          Text(
                            "DOC",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
