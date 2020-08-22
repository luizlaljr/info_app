import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/manager_controller.dart';

class DrawerOperationalityWidget extends StatelessWidget {
  final String title;

  const DrawerOperationalityWidget({Key key, this.title}) : super(key: key);
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
                              value: _controller.checkboxInstructor,
                              onChanged: _controller.setCheckboxInstructor,
                            ),
                          ),
                          Text(
                            "IN",
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
                              value: _controller.checkboxOperational,
                              onChanged: _controller.setCheckboxOperational,
                            ),
                          ),
                          Text(
                            "OP",
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
                              value: _controller.checkboxBasic,
                              onChanged: _controller.setCheckboxBasic,
                            ),
                          ),
                          Text(
                            "PB",
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
                              value: _controller.checkboxNoob,
                              onChanged: _controller.setCheckboxNoob,
                            ),
                          ),
                          Text(
                            "AL",
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
