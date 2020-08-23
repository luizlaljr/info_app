import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/shared/components/drawer_widget.dart';
import 'package:info_app/app/modules/manager/shared/components/listcard.dart';
import 'package:info_app/app/modules/manager/shared/models/manager_model.dart';
import 'manager_controller.dart';

class ManagerPage extends StatefulWidget {
  final String title;
  const ManagerPage({Key key, this.title = "Manager"}) : super(key: key);

  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends ModularState<ManagerPage, ManagerController> {
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
                      "Militares",
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
                if (controller.manager.error != null) {
                  return Expanded(
                    child: Container(
                      color: Color(0xFF22466A),
                      child: Center(
                        child: Text('Erro de Conexão!'),
                      ),
                    ),
                  );
                }
                if (controller.manager.value == null) {
                  return Expanded(
                    child: Container(
                      color: Color(0xFF22466A),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                if (controller.manager.value.length == 0) {
                  return Expanded(
                    child: Container(
                      color: Color(0xFF22466A),
                      child: Center(
                        child: Text(
                          'Não há militares cadastrados.',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  );
                }
                List<ManagerModel> managerList = buildManagerList(controller);
                if (managerList.isEmpty){
                  return Expanded(
                    child: Container(
                      color: Color(0xFF22466A),
                      child: Center(
                        child: Text(
                          'Não há militares nesta condição.',
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
                      itemCount: managerList.length,
                      itemBuilder: (BuildContext contexto, int index) {
                        return ListCard(
                          index: index,
                          managerList: managerList,
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

List<ManagerModel> buildManagerList(controller) {
  if (controller.filteredManager == null) {
    return controller.manager.value;
  }
  return controller.filteredManager;
}
