import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/home_module.dart';
import 'package:info_app/app/modules/manager/manager_module.dart';
import 'package:info_app/app/modules/status/status_module.dart';

import 'tabb_controller.dart';

class TabbPage extends StatefulWidget {
  final String title;
  const TabbPage({Key key, this.title = "Tabb"}) : super(key: key);

  @override
  _TabbPageState createState() => _TabbPageState();
}

class _TabbPageState extends ModularState<TabbPage, TabbController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.profile.error != null) {
        Container(
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
      if (controller.profile.value == null) {
        return CircularProgressIndicator();
      }
      return Scaffold(
        body: PageView(
          controller: controller.pageController,
          children: buildWidgets(controller.profile.value),
          onPageChanged: controller.changePage,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF12365A),
          currentIndex: controller.selectIndex ?? 0,
          onTap: controller.changePage,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          showUnselectedLabels: false,
          items: buildNavigationBarItens(controller.profile.value),
        ),
      );
    });
  }
}

List<Widget> buildWidgets(String profile) {
  List<Widget> list = [];
  Widget statusWidget = StatusModule();
  list.add(statusWidget);
  Widget homeWidget = HomeModule();
  list.add(homeWidget);
  if (profile != 'C' && profile != null) {
    Widget managerWidget = RouterOutlet(
      module: ManagerModule(),
      keepAlive: false,
    );
    list.add(managerWidget);
  }
  return list;
}

List<BottomNavigationBarItem> buildNavigationBarItens(String profile) {
  List<BottomNavigationBarItem> list = [];
  BottomNavigationBarItem statusItem = BottomNavigationBarItem(
    icon: Icon(Icons.person),
    title: Text('Status'),
    activeIcon: Icon(Icons.person),
  );
  list.add(statusItem);
  BottomNavigationBarItem homeItem = BottomNavigationBarItem(
    icon: Icon(Icons.flight),
    title: Text('Missões'),
    activeIcon: Icon(Icons.flight),
  );
  list.add(homeItem);
  if (profile != 'C' && profile != null) {
    BottomNavigationBarItem managerItem = BottomNavigationBarItem(
      icon: Icon(Icons.group),
      title: Text('Controles'),
      activeIcon: Icon(Icons.group),
    );
    list.add(managerItem);
  }
  return list;
}
