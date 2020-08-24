// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatusController on _StatusControllerBase, Store {
  final _$userAtom = Atom(name: '_StatusControllerBase.user');

  @override
  ObservableFuture<dynamic> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ObservableFuture<dynamic> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$userSkinAtom = Atom(name: '_StatusControllerBase.userSkin');

  @override
  ObservableFuture<dynamic> get userSkin {
    _$userSkinAtom.reportRead();
    return super.userSkin;
  }

  @override
  set userSkin(ObservableFuture<dynamic> value) {
    _$userSkinAtom.reportWrite(value, super.userSkin, () {
      super.userSkin = value;
    });
  }

  final _$setSkinAsyncAction = AsyncAction('_StatusControllerBase.setSkin');

  @override
  Future<dynamic> setSkin(dynamic skin) {
    return _$setSkinAsyncAction.run(() => super.setSkin(skin));
  }

  @override
  String toString() {
    return '''
user: ${user},
userSkin: ${userSkin}
    ''';
  }
}
