import 'package:flutter/material.dart';

class BuildStatusWidget extends StatelessWidget {
  final String status;

  const BuildStatusWidget({Key key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.blueGrey[700],
          fontSize: 23.0,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
