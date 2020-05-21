import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/status_controller.dart';

class BuildProjectImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatusController controller = Modular.get();
    var project = controller.user.value.project;

    Size screenSize = MediaQuery.of(context).size;
    String pathImage = "assets/images/$project.jpg";

    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Container(
        height: screenSize.height / 2.6,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700],
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.5, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          image: DecorationImage(
            image: AssetImage(pathImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
