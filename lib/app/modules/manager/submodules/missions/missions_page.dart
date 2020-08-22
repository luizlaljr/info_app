import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/submodules/missions/shared/components/drawer_widget.dart';
import 'package:info_app/app/modules/manager/submodules/missions/shared/components/listcard.dart';
import 'package:info_app/app/modules/manager/submodules/missions/shared/models/mission_model.dart';
import 'missions_controller.dart';

class MissionsPage extends StatefulWidget {
  final String title;
  const MissionsPage({Key key, @required this.title}) : super(key: key);

  @override
  _MissionsPageState createState() => _MissionsPageState();
}

class _MissionsPageState
    extends ModularState<MissionsPage, MissionsController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              color: Color(0xFF12365A),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Center(
                        child: Text(
                      widget.title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) {
                if (controller.missions.error != null) {
                  return Expanded(
                    child: Container(
                      color: Color(0xFF22466A),
                      child: Center(
                        child: Text('Erro de Conexão!'),
                      ),
                    ),
                  );
                }
                if (controller.missions.value == null) {
                  return Expanded(
                    child: Container(
                      color: Color(0xFF22466A),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                if (controller.missions.value.length == 0) {
                  return Expanded(
                    child: Container(
                      color: Color(0xFF22466A),
                      child: Center(
                        child: Text(
                          'Não há missoẽs lançadas.',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  );
                }
                List<MissionModel> missionsList = buildMissionsList(controller);
                return Expanded(
                  child: Container(
                    color: Color(0xFF22466A),
                    child: ListView.builder(
                      itemCount: missionsList.length,
                      itemBuilder: (BuildContext contexto, int index) {
                        return ListCard(
                          index: index,
                          missionsList: missionsList,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<MissionModel> buildMissionsList(controller) {
  if (controller.filteredMissions == null) {
    return controller.missions.value;
  }
  if (controller.filteredMissions.isEmpty) {
    return controller.missions.value;
  }
  return controller.filteredMissions;
}
