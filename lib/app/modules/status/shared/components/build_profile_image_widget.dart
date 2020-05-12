import 'package:flutter/material.dart';

class BuildProfileImageWidget extends StatelessWidget {
  final String pathImage;

  const BuildProfileImageWidget({Key key, this.pathImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pathImage),
            fit: BoxFit.cover,
          ),
          color: Colors.amber[50],
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.blue[300],
            width: 6.0,
          ),
        ),
      ),
    );
  }
}
