import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/manager_controller.dart';

class DrawerConditionWidget extends StatelessWidget {
  final String title;
  final ManagerController _controller = Modular.get();

  DrawerConditionWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            return Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.white54),
                        child: Checkbox(
                          autofocus: false,
                          tristate: false,
                          value: _controller.checkboxComissioned,
                          onChanged: _controller.setCheckboxComissioned,
                        ),
                      ),
                      Icon(
                        Icons.copyright,
                        color: Colors.lightGreenAccent,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0.0),
                      ),
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.white54),
                        child: Checkbox(
                          autofocus: false,
                          tristate: false,
                          value: _controller.checkboxDaily,
                          onChanged: _controller.setCheckboxDaily,
                        ),
                      ),
                      Icon(
                        Icons.monetization_on,
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
