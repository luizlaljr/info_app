// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missions_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MissionsController on _MissionsControllerBase, Store {
  final _$inputTextNumberControllerAtom =
      Atom(name: '_MissionsControllerBase.inputTextNumberController');

  @override
  TextEditingController get inputTextNumberController {
    _$inputTextNumberControllerAtom.reportRead();
    return super.inputTextNumberController;
  }

  @override
  set inputTextNumberController(TextEditingController value) {
    _$inputTextNumberControllerAtom
        .reportWrite(value, super.inputTextNumberController, () {
      super.inputTextNumberController = value;
    });
  }

  final _$inputTextLocaleControllerAtom =
      Atom(name: '_MissionsControllerBase.inputTextLocaleController');

  @override
  TextEditingController get inputTextLocaleController {
    _$inputTextLocaleControllerAtom.reportRead();
    return super.inputTextLocaleController;
  }

  @override
  set inputTextLocaleController(TextEditingController value) {
    _$inputTextLocaleControllerAtom
        .reportWrite(value, super.inputTextLocaleController, () {
      super.inputTextLocaleController = value;
    });
  }

  final _$inputTextDateControllerAtom =
      Atom(name: '_MissionsControllerBase.inputTextDateController');

  @override
  TextEditingController get inputTextDateController {
    _$inputTextDateControllerAtom.reportRead();
    return super.inputTextDateController;
  }

  @override
  set inputTextDateController(TextEditingController value) {
    _$inputTextDateControllerAtom
        .reportWrite(value, super.inputTextDateController, () {
      super.inputTextDateController = value;
    });
  }

  final _$missionsAtom = Atom(name: '_MissionsControllerBase.missions');

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

  final _$filteredMissionsAtom =
      Atom(name: '_MissionsControllerBase.filteredMissions');

  @override
  List<MissionModel> get filteredMissions {
    _$filteredMissionsAtom.reportRead();
    return super.filteredMissions;
  }

  @override
  set filteredMissions(List<MissionModel> value) {
    _$filteredMissionsAtom.reportWrite(value, super.filteredMissions, () {
      super.filteredMissions = value;
    });
  }

  final _$filteredKindAtom = Atom(name: '_MissionsControllerBase.filteredKind');

  @override
  List<MissionModel> get filteredKind {
    _$filteredKindAtom.reportRead();
    return super.filteredKind;
  }

  @override
  set filteredKind(List<MissionModel> value) {
    _$filteredKindAtom.reportWrite(value, super.filteredKind, () {
      super.filteredKind = value;
    });
  }

  final _$filteredNumberAtom =
      Atom(name: '_MissionsControllerBase.filteredNumber');

  @override
  List<MissionModel> get filteredNumber {
    _$filteredNumberAtom.reportRead();
    return super.filteredNumber;
  }

  @override
  set filteredNumber(List<MissionModel> value) {
    _$filteredNumberAtom.reportWrite(value, super.filteredNumber, () {
      super.filteredNumber = value;
    });
  }

  final _$filteredLocaleAtom =
      Atom(name: '_MissionsControllerBase.filteredLocale');

  @override
  List<MissionModel> get filteredLocale {
    _$filteredLocaleAtom.reportRead();
    return super.filteredLocale;
  }

  @override
  set filteredLocale(List<MissionModel> value) {
    _$filteredLocaleAtom.reportWrite(value, super.filteredLocale, () {
      super.filteredLocale = value;
    });
  }

  final _$filteredDateAtom = Atom(name: '_MissionsControllerBase.filteredDate');

  @override
  List<MissionModel> get filteredDate {
    _$filteredDateAtom.reportRead();
    return super.filteredDate;
  }

  @override
  set filteredDate(List<MissionModel> value) {
    _$filteredDateAtom.reportWrite(value, super.filteredDate, () {
      super.filteredDate = value;
    });
  }

  final _$checkboxMissionOrderAtom =
      Atom(name: '_MissionsControllerBase.checkboxMissionOrder');

  @override
  bool get checkboxMissionOrder {
    _$checkboxMissionOrderAtom.reportRead();
    return super.checkboxMissionOrder;
  }

  @override
  set checkboxMissionOrder(bool value) {
    _$checkboxMissionOrderAtom.reportWrite(value, super.checkboxMissionOrder,
        () {
      super.checkboxMissionOrder = value;
    });
  }

  final _$checkboxServiceOrderAtom =
      Atom(name: '_MissionsControllerBase.checkboxServiceOrder');

  @override
  bool get checkboxServiceOrder {
    _$checkboxServiceOrderAtom.reportRead();
    return super.checkboxServiceOrder;
  }

  @override
  set checkboxServiceOrder(bool value) {
    _$checkboxServiceOrderAtom.reportWrite(value, super.checkboxServiceOrder,
        () {
      super.checkboxServiceOrder = value;
    });
  }

  final _$inputTextNumberAtom =
      Atom(name: '_MissionsControllerBase.inputTextNumber');

  @override
  String get inputTextNumber {
    _$inputTextNumberAtom.reportRead();
    return super.inputTextNumber;
  }

  @override
  set inputTextNumber(String value) {
    _$inputTextNumberAtom.reportWrite(value, super.inputTextNumber, () {
      super.inputTextNumber = value;
    });
  }

  final _$inputTextLocaleAtom =
      Atom(name: '_MissionsControllerBase.inputTextLocale');

  @override
  String get inputTextLocale {
    _$inputTextLocaleAtom.reportRead();
    return super.inputTextLocale;
  }

  @override
  set inputTextLocale(String value) {
    _$inputTextLocaleAtom.reportWrite(value, super.inputTextLocale, () {
      super.inputTextLocale = value;
    });
  }

  final _$inputTextDateAtom =
      Atom(name: '_MissionsControllerBase.inputTextDate');

  @override
  String get inputTextDate {
    _$inputTextDateAtom.reportRead();
    return super.inputTextDate;
  }

  @override
  set inputTextDate(String value) {
    _$inputTextDateAtom.reportWrite(value, super.inputTextDate, () {
      super.inputTextDate = value;
    });
  }

  final _$logoffAsyncAction = AsyncAction('_MissionsControllerBase.logoff');

  @override
  Future<dynamic> logoff() {
    return _$logoffAsyncAction.run(() => super.logoff());
  }

  final _$_MissionsControllerBaseActionController =
      ActionController(name: '_MissionsControllerBase');

  @override
  List<List<MissionModel>> getFilters() {
    final _$actionInfo = _$_MissionsControllerBaseActionController.startAction(
        name: '_MissionsControllerBase.getFilters');
    try {
      return super.getFilters();
    } finally {
      _$_MissionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckboxMissionOrder(bool check) {
    final _$actionInfo = _$_MissionsControllerBaseActionController.startAction(
        name: '_MissionsControllerBase.setCheckboxMissionOrder');
    try {
      return super.setCheckboxMissionOrder(check);
    } finally {
      _$_MissionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckboxServiceOrder(bool check) {
    final _$actionInfo = _$_MissionsControllerBaseActionController.startAction(
        name: '_MissionsControllerBase.setCheckboxServiceOrder');
    try {
      return super.setCheckboxServiceOrder(check);
    } finally {
      _$_MissionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInputTextNumber(String number) {
    final _$actionInfo = _$_MissionsControllerBaseActionController.startAction(
        name: '_MissionsControllerBase.setInputTextNumber');
    try {
      return super.setInputTextNumber(number);
    } finally {
      _$_MissionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInputTextLocale(String locale) {
    final _$actionInfo = _$_MissionsControllerBaseActionController.startAction(
        name: '_MissionsControllerBase.setInputTextLocale');
    try {
      return super.setInputTextLocale(locale);
    } finally {
      _$_MissionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInputTextDate(String date) {
    final _$actionInfo = _$_MissionsControllerBaseActionController.startAction(
        name: '_MissionsControllerBase.setInputTextDate');
    try {
      return super.setInputTextDate(date);
    } finally {
      _$_MissionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
inputTextNumberController: ${inputTextNumberController},
inputTextLocaleController: ${inputTextLocaleController},
inputTextDateController: ${inputTextDateController},
missions: ${missions},
filteredMissions: ${filteredMissions},
filteredKind: ${filteredKind},
filteredNumber: ${filteredNumber},
filteredLocale: ${filteredLocale},
filteredDate: ${filteredDate},
checkboxMissionOrder: ${checkboxMissionOrder},
checkboxServiceOrder: ${checkboxServiceOrder},
inputTextNumber: ${inputTextNumber},
inputTextLocale: ${inputTextLocale},
inputTextDate: ${inputTextDate}
    ''';
  }
}
