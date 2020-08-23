import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/shared/components/drawer_widget.dart';
import 'package:info_app/app/modules/home/shared/components/listcard.dart';
import 'package:info_app/app/modules/home/shared/models/mission_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
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
                    width: 100,
                    child: Center(
                        child: Text(
                      "Missões",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )),
                  ),
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
            ),
            Observer(
              builder: (_) {
                if (controller.missions.error != null) {
                  return Expanded(
                    child: Container(
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
                if (missionsList.isEmpty){
                  return Expanded(
                    child: Container(
                      color: Color(0xFF22466A),
                      child: Center(
                        child: Text(
                          'Não há missões nesta condição.',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  );
                }
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
  return controller.filteredMissions;
}
