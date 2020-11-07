import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Container(
        color: Color(0xFF22466A),
        child: Observer(
          builder: (_) {
            if (controller.user.error != null) {
              return Container(
                color: Color(0xFF22466A),
                child: Center(
                  child: Text(
                    'Erro de Conexão!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            }
            if (controller.user.value == null) {
              return Container(
                color: Color(0xFF22466A),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Stack(
              children: <Widget>[
                BuildProjectImageWidget(),
                SafeArea(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            child: IconButton(
                              icon: Icon(Icons.input),
                              color: Colors.white,
                              onPressed: controller.logoff,
                            ),
                          ),
                        ],
                      ),
                      Flex(
                        direction: Axis.vertical,
                        children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 11),
                          BuildProfileImageWidget(),
                          BuildFullnameWidget(),
                          BuildStatusWidget(),
                          BuildStatContainerWidget(),
                          BuildInfoContainerWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
