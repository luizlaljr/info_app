// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ManagerController on _ManagerControllerBase, Store {
  final _$managerAtom = Atom(name: '_ManagerControllerBase.manager');

  @override
  ObservableFuture<dynamic> get manager {
    _$managerAtom.reportRead();
    return super.manager;
  }

  @override
  set manager(ObservableFuture<dynamic> value) {
    _$managerAtom.reportWrite(value, super.manager, () {
      super.manager = value;
    });
  }

  @override
  String toString() {
    return '''
manager: ${manager}
    ''';
  }
}
