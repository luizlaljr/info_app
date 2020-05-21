import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../status_controller.dart';

class BuildStatusWidget extends StatelessWidget {
  final StatusController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final status = controller.user.value.operationality;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        buildStatusText(status),
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

String buildStatusText(status) {
  var text;
  switch (status) {
    case "IN":
      text = 'Instrutor';
      break;
    case "PO":
      text = 'Piloto Operacional';
      break;
    case "PB":
      text = 'Piloto Básico';
      break;
    case "AL":
      text = 'Aluno';
      break;
    default:
      text = 'Operacional';
  }
  return text;
}
