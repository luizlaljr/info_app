import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/status_controller.dart';
import 'build_stat_item_widget.dart';

class BuildStatContainerWidget extends StatelessWidget {
  final StatusController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: 80,
      decoration: BoxDecoration(
        //color: Color(0xFFEFF4F7),
        border: Border.all(width: 0.05),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buildWidget(controller.reports.value),
      ),
    );
  }
}

List<Widget> buildWidget(reports) {
  List<Widget> list = [];
  list.add(Container(
      width: 5,
    ));
  for (var i = 0; i < reports.length; i++) {
    list.add(Expanded(child: BuildStatItemWidget(report: reports[i])));
    list.add(Container(
      width: 5,
    ));
    list.add(Container(
      width: 5,
    ));
  }
  return list;
}
