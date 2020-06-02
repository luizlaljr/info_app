import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/status/shared/models/report_model.dart';
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
        border: Border.all(width: 0.05),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buildWidget(controller.user.value),
      ),
    );
  }
}

List<Widget> buildWidget(user) {
  List<Widget> list = [];
  list.add(Container(
    width: 5,
  ));
  if (user.reports.length > 0) {
    for (var i = 0; i < user.reports.length; i++) {
      list.add(Expanded(child: BuildStatItemWidget(report: user.reports[i])));
      list.add(Container(
        width: 5,
      ));
      list.add(Container(
        width: 5,
      ));
    }
  } else {
    list.add(
      Expanded(
        child: BuildStatItemWidget(
          report: ReportModel(
            link: buildConditionText(user.condition),
            amount: 0,
            income: 0,
          ),
        ),
      ),
    );
  }
  return list;
}

String buildConditionText(condition) {
  return condition ? "C" : "D";
}
