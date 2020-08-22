import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/home_controller.dart';

class DrawerDateWidget extends StatelessWidget {
  final String title;
  final HomeController _controller = Modular.get();

  DrawerDateWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) {
          return Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller: _controller.inputTextDateController,
                        onChanged: _controller.setInputTextDate,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.datetime,
                        textCapitalization: TextCapitalization.characters,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 1.1),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.highlight_off,
                              color: Colors.white70,
                            ),
                            onPressed: () => {
                              _controller.inputTextDateController.clear(),
                              _controller.setInputTextDate(""),
                            },
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
