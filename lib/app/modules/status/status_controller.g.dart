// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatusController on _StatusControllerBase, Store {
  final _$reportsAtom = Atom(name: '_StatusControllerBase.reports');

  @override
  ObservableFuture<dynamic> get reports {
    _$reportsAtom.context.enforceReadPolicy(_$reportsAtom);
    _$reportsAtom.reportObserved();
    return super.reports;
  }

  @override
  set reports(ObservableFuture<dynamic> value) {
    _$reportsAtom.context.conditionallyRunInAction(() {
      super.reports = value;
      _$reportsAtom.reportChanged();
    }, _$reportsAtom, name: '${_$reportsAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'reports: ${reports.toString()}';
    return '{$string}';
  }
}
