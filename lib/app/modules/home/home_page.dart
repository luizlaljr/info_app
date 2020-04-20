import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  @override
  // TODO: implement controller
  HomeController get controller => super.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(builder: (_) {
          if (controller.missions.error != null) {
            return Center(
              child: Text('Error'),
            );
          }
          if (controller.missions.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var list = controller.missions.value;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext contexto, int index) {
              return ListTile(
                title: Text(list[index].number),
                subtitle: Text(list[index].locale),
              );
            },
          );
        }));
  }
}
