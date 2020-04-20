// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$missionsAtom = Atom(name: '_HomeControllerBase.missions');

  @override
  ObservableFuture<dynamic> get missions {
    _$missionsAtom.context.enforceReadPolicy(_$missionsAtom);
    _$missionsAtom.reportObserved();
    return super.missions;
  }

  @override
  set missions(ObservableFuture<dynamic> value) {
    _$missionsAtom.context.conditionallyRunInAction(() {
      super.missions = value;
      _$missionsAtom.reportChanged();
    }, _$missionsAtom, name: '${_$missionsAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'missions: ${missions.toString()}';
    return '{$string}';
  }
}
