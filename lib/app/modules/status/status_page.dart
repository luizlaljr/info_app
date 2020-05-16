import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/shared/components/build_fullname_widget.dart';
import 'package:info_app/app/modules/status/shared/components/build_profile_image_widget.dart';
import 'package:info_app/app/modules/status/shared/components/build_stat_container_widget.dart';
import 'shared/components/build_cover_image.dart';
import 'shared/components/build_info_container_widget.dart';
import 'shared/components/build_status_widget.dart';
import 'status_controller.dart';

class StatusPage extends StatefulWidget {
  final String title;
  const StatusPage({Key key, this.title = "Status"}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends ModularState<StatusPage, StatusController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (controller.user.error != null) {
            return Center(
              child: Text("Error"),
            );
          }
          if (controller.user.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final user = controller.user.value;
          Size screenSize = MediaQuery.of(context).size;
          String pathCoverImage = "assets/images/c99.jpg";
          String pathProfileImage = "assets/images/pilot.png";
          String fullName = user.post + " " + user.name;
          String status = "Instrutor";
          return Stack(
            children: <Widget>[
              BuildImageWidget(
                screenSize: screenSize,
                pathImage: pathCoverImage,
              ),
              SafeArea(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: screenSize.height / 5.3),
                    BuildProfileImageWidget(pathImage: pathProfileImage),
                    BuildFullnameWidget(fullName: fullName),
                    BuildStatusWidget(status: status),
                    BuildStatContainerWidget(),
                    BuildInfoContainerWidget(),
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
