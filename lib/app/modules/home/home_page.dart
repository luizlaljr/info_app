import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/shared/components/listcard.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
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
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Modular.to.pushNamedAndRemoveUntil('/Status',ModalRoute.withName('/'));
              }),
        ],
      ),
      body: Observer(
        builder: (_) {
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

          return ListView.builder(
            itemCount: controller.missions.value.length,
            itemBuilder: (BuildContext contexto, int index) {
              return ListCard(index: index);
            },
          );
        },
      ),
    );
  }
}
