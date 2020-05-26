// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$userAtom = Atom(name: '_AuthControllerBase.user');

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthControllerBase.login');

  @override
  Future<String> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  final _$getUserAsyncAction = AsyncAction('_AuthControllerBase.getUser');

  @override
  Future<String> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic _setUser(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase._setUser');
    try {
      return super._setUser(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
