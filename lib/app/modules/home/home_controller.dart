import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/home/shared/models/mission_model.dart';
import 'package:info_app/app/modules/home/shared/repositories/mission_repository.dart';
import 'package:info_app/app/modules/home/shared/utils/filters.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final MissionRepository _repository = Modular.get();

  @observable
  ObservableFuture missions;

  @observable
  TextEditingController inputTextNumberController = TextEditingController();

  @observable
  TextEditingController inputTextLocaleController = TextEditingController();

  @observable
  TextEditingController inputTextDateController = TextEditingController();

  @observable
  List<MissionModel> filteredMissions;

  @observable
  List<MissionModel> filteredKind;

  @observable
  List<MissionModel> filteredNumber;

  @observable
  List<MissionModel> filteredLocale;

  @observable
  List<MissionModel> filteredDate;

  @observable
  bool checkboxMissionOrder = true;

  @observable
  bool checkboxServiceOrder = true;

  @observable
  String inputTextNumber = '';

  @observable
  String inputTextLocale = '';

  @observable
  String inputTextDate = '';


  _HomeControllerBase() {    
    missions = _repository.getMissions().asObservable();
  }

  @action
  List<List<MissionModel>> getFilters() {
    List<List<MissionModel>> filters = [
      filteredKind,
      filteredNumber,
      filteredLocale,
      filteredDate,
    ];
    return filters;
  }

  @action
  void setCheckboxMissionOrder(bool check) {
    checkboxMissionOrder = check ? true : false;
    filteredKind = filterKind();
    List<List<MissionModel>> listFilters = getFilters();
    filteredMissions = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxServiceOrder(bool check) {
    checkboxServiceOrder = check ? true : false;
    filteredKind = filterKind();
    List<List<MissionModel>> listFilters = getFilters();
    filteredMissions = Filters.joinFilters(listFilters);
  }

  @action
  void setInputTextNumber(String number) {
    inputTextNumber = number;
    filteredNumber = filterNumber();
    List<List<MissionModel>> listFilters = getFilters();
    filteredMissions = Filters.joinFilters(listFilters);
  }

  @action
  void setInputTextLocale(String locale) {
    inputTextLocale = locale;
    filteredLocale = filterLocale();
    List<List<MissionModel>> listFilters = getFilters();
    filteredMissions = Filters.joinFilters(listFilters);
  }

  @action
  void setInputTextDate(String date) {
    inputTextDate = date;
    filteredDate = filterDate();
    List<List<MissionModel>> listFilters = getFilters();
    filteredMissions = Filters.joinFilters(listFilters);
  }

  List<MissionModel> filterKind() {
    return Filters.kind(missions, checkboxMissionOrder, checkboxServiceOrder);
  }

  List<MissionModel> filterNumber() {
    return Filters.number(missions, inputTextNumber);
  }

  List<MissionModel> filterLocale() {
    return Filters.locale(missions, inputTextLocale);
  }

  List<MissionModel> filterDate() {
    return Filters.date(missions, inputTextDate);
  }

  Future logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushNamedAndRemoveUntil(Modular.initialRoute, ModalRoute.withName(Modular.initialRoute));
  }
}
