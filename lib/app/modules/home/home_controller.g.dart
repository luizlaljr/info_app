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
    _$missionsAtom.reportRead();
    return super.missions;
  }

  @override
  set missions(ObservableFuture<dynamic> value) {
    _$missionsAtom.reportWrite(value, super.missions, () {
      super.missions = value;
    });
  }

  @override
  String toString() {
    return '''
missions: ${missions}
    ''';
  }
}
