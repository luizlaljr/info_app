import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/home_module.dart';
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
    return Scaffold(
      body: PageView(
        
        controller: controller.pageController,
        children: <Widget>[StatusModule(), HomeModule(),],
      ),
      bottomNavigationBar: Observer(builder: (BuildContext context) {
        return BottomNavigationBar(
            backgroundColor: Color(0xFF12365A),
            currentIndex: controller.selectIndex,
            onTap: controller.changePage,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white38,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[              
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                title: Text('Status'),
                activeIcon: Icon(
                  Icons.person,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.flight,
                ),
                title: Text('Missões'),
                activeIcon: Icon(
                  Icons.flight,
                ),
              ),
            ],
        );
      }),
    );
  }
}
