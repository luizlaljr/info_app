import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'tabb_controller.g.dart';

class TabbController = _TabbControllerBase with _$TabbController;

abstract class _TabbControllerBase with Store {
  var pageController = PageController();

  @observable
  int selectIndex = 0;

  @action
  void changePage(int index) {
    pageController.jumpToPage(index);
    selectIndex = index;
  }
}
