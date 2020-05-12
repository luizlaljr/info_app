import 'package:flutter/material.dart';

class BuildImageWidget extends StatelessWidget {
  final Size screenSize;
  final String pathImage;

  const BuildImageWidget({Key key, this.screenSize, this.pathImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Container(
        height: screenSize.height / 2.6,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700],
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.5, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          image: DecorationImage(
            image: AssetImage(pathImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
