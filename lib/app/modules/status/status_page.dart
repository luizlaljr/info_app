import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'shared/components/build_fullname_widget.dart';
import 'shared/components/build_profile_image_widget.dart';
import 'shared/components/build_stat_container_widget.dart';
import 'shared/components/build_info_container_widget.dart';
import 'shared/components/build_project_image_widget.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.highlight_off),
          onPressed: controller.logoff,
        ),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Modular.to.pushNamedAndRemoveUntil('/Home',ModalRoute.withName('/'));
              }),
        ],
      ),
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
          return Stack(
            children: <Widget>[
              BuildProjectImageWidget(),
              SafeArea(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height / 5.3),
                    BuildProfileImageWidget(),
                    BuildFullnameWidget(),
                    BuildStatusWidget(),
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
