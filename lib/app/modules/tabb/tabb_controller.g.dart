// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabb_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TabbController on _TabbControllerBase, Store {
  final _$selectIndexAtom = Atom(name: '_TabbControllerBase.selectIndex');

  @override
  int get selectIndex {
    _$selectIndexAtom.reportRead();
    return super.selectIndex;
  }

  @override
  set selectIndex(int value) {
    _$selectIndexAtom.reportWrite(value, super.selectIndex, () {
      super.selectIndex = value;
    });
  }

  final _$_TabbControllerBaseActionController =
      ActionController(name: '_TabbControllerBase');

  @override
  void changePage(int index) {
    final _$actionInfo = _$_TabbControllerBaseActionController.startAction(
        name: '_TabbControllerBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_TabbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectIndex: ${selectIndex}
    ''';
  }
}
