import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/manager_controller.dart';

class DrawerAmountWidget extends StatelessWidget {
  final String title;
  final ManagerController _controller = Modular.get();

  DrawerAmountWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Container(
                child: DropdownButton<String>(
                  value: _controller.selectedOptionsOperator,
                  iconEnabledColor: Colors.white70,
                  elevation: 16,
                  dropdownColor: Color(0xFF22466A),
                  items: _controller.optionsOperator
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    );
                  }).toList(),
                  onChanged: _controller.setSelectedOptionsOperator,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _controller.inputTextAmountController,
                  onChanged: _controller.setInputTextAmount,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
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
                        _controller.setInputTextAmount(""),
                        _controller.inputTextAmountController.clear(),
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
          );
        },
      ),
    );
  }
}
