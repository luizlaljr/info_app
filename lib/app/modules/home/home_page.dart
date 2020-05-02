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
  
  @override
  HomeController get controller => super.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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

          var list = controller.missions.value;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext contexto, int index) {
              return Card(
                elevation: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 2.0,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.local_airport,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      list[index].number,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Icon(
                          Icons.local_hotel,
                          color: Colors.yellowAccent,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 0.0),
                        ),
                        Text(
                          list[index].locale,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
