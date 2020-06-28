import 'package:flutter/material.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'tabb_controller.g.dart';

class TabbController = _TabbControllerBase with _$TabbController;

abstract class _TabbControllerBase with Store {
  final AuthController _auth;
  var pageController = PageController();

  @observable
  ObservableFuture profile;

  @observable
  int selectIndex;

  _TabbControllerBase(this._auth){
    profile = _auth.getProfile().asObservable();
  }

  @action
  void changePage(int index) {
    pageController.jumpToPage(index);
    selectIndex = index;
  }
}
