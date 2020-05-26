import 'package:flutter/material.dart';
import 'package:info_app/app/modules/status/shared/models/report_model.dart';
import 'package:info_app/app/shared/utils/formatter.dart';

class BuildStatItemWidget extends StatelessWidget {
  final ReportModel report;

  const BuildStatItemWidget({Key key, this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(0.07),
      child: Container(
        width: 122,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.2, 1],
            colors: buildColors(report.link),
          ),
          //,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700],
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 0.3, //extend the shadow
              offset: Offset(
                3.0, // Move to right 10  horizontally
                7.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                buildLinkText(report.link),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2.0),
              ),
              Divider(height: 0.5, thickness: 0.6, color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Qtd.:",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    report.amount.toStringAsFixed(1),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "R\$",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    Formatter.money(report.income),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

buildColors(link) {
  List<Color> colors = [];
  var colorBegin;
  var colorEnd;
  switch (link) {
    case "C":
      colorBegin = Colors.green[700];
      colorEnd = Colors.lightGreenAccent[700];
      break;
    case "G":
      colorBegin = Colors.orange[700];
      colorEnd = Colors.yellow;
      break;
    default:
      colorBegin = Color(0xFF4782FB);
      colorEnd = Color(0xFF00D6ED);
  }

  colors.add(colorBegin);
  colors.add(colorEnd);
  return colors;
}

String buildLinkText(link) {
  var text;
  switch (link) {
    case "C":
      text = 'Comissionamento';
      break;
    case "G":
      text = 'Grat Rep';
      break;
    default:
      text = 'Diária';
  }
  return text;
}
