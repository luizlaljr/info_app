import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/manager_controller.dart';
import 'package:info_app/app/modules/manager/submodules/missions/shared/models/mission_model.dart';
import 'package:info_app/app/modules/manager/submodules/missions/shared/repositories/mission_repository.dart';
import 'package:info_app/app/modules/manager/submodules/missions/shared/utils/filters.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'missions_controller.g.dart';

class MissionsController = _MissionsControllerBase with _$MissionsController;

abstract class _MissionsControllerBase with Store {
  final MissionRepository _repository = Modular.get();
  final ManagerController _controller = Modular.get();

  @observable
  TextEditingController inputTextNumberController = TextEditingController();

  @observable
  TextEditingController inputTextLocaleController = TextEditingController();

  @observable
  TextEditingController inputTextDateController = TextEditingController();

  @observable
  ObservableFuture missions;

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
  bool checkboxMissionOrder = false;

  @observable
  bool checkboxServiceOrder = false;

  @observable
  String inputTextNumber = '';

  @observable
  String inputTextLocale = '';

  @observable
  String inputTextDate = '';

  _MissionsControllerBase() {
    missions = _repository.getMissions(_controller.selectedUser).asObservable();
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

  @action
  Future logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushNamedAndRemoveUntil(
        Modular.initialRoute, ModalRoute.withName(Modular.initialRoute));
  }
}
