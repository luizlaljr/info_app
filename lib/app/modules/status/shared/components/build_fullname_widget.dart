import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:ui' as ui;

import '../../status_controller.dart';

class BuildFullnameWidget extends StatelessWidget {
  final StatusController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.blue[700],
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
    );

    final user = controller.user.value;
    final fullName = user.post + " " + user.name;

    return Container(
      margin: EdgeInsets.only(top: 12.0),
      child: new Stack(
        children: [
          new Positioned(
            top: 2.0,
            left: 2.0,
            child: new Text(
              fullName,
              style: _nameTextStyle.copyWith(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: new Text(fullName, style: _nameTextStyle),
          ),
        ],
      ),
    );
  }
}
