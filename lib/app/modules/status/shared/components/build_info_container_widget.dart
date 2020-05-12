import 'package:flutter/material.dart';

class BuildInfoContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Divider(
              color: Colors.cyan[200],
              thickness: 3.5,
              height: 0.5,
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
              height: 5.0,
            ),
            Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Condição:",
                    style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                  Text("Comissionado",
                    style: TextStyle(
                        color: Colors.indigo[800], fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Data da Condição:",
                    style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                  Text("1/3/2020",
                    style: TextStyle(
                        color: Colors.indigo[800], fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Documento:",
                    style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "FAX 967/SPOG-3/1254",
                    style: TextStyle(
                        color: Colors.indigo[800], fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
              height: 9,
            ),
            Divider(
              color: Colors.cyan[200],
              thickness: 3.5,
              height: 1.7,
            ),
          ],
        ),
      ),
    );
  }
}
