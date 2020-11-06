import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:info_app/app/modules/manager/shared/models/manager_model.dart';
import 'package:info_app/app/modules/manager/shared/repositories/manager_repository.dart';
import 'package:info_app/app/modules/manager/shared/utils/filters.dart';
import 'package:info_app/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'manager_controller.g.dart';

class ManagerController = _ManagerControllerBase with _$ManagerController;

abstract class _ManagerControllerBase with Store {
  final ManagerRepository _repository = Modular.get();

  @observable
  int selectedUser;

  @observable
  ObservableFuture manager;

  @observable
  List<ManagerModel> filteredManager;

  @observable
  List<ManagerModel> filteredCondition;

  @observable
  List<ManagerModel> filteredProject;

  @observable
  List<ManagerModel> filteredActivity;

  @observable
  List<ManagerModel> filteredOperationality;

  @observable
  List<ManagerModel> filteredAmount;

  @observable
  List<ManagerModel> filteredModulus;

  @observable
  List<ManagerModel> filteredName;

  @observable
  bool checkboxComissioned = false;

  @observable
  bool checkboxDaily = false;

  @observable
  bool checkboxNineNine = false;

  @observable
  bool checkboxNineSeven = false;

  @observable
  bool checkboxPilot = false;

  @observable
  bool checkboxMechanic = false;

  @observable
  bool checkboxAttendant = false;

  @observable
  bool checkboxDoctor = false;

  @observable
  bool checkboxInstructor = false;

  @observable
  bool checkboxOperational = false;

  @observable
  bool checkboxBasic = false;

  @observable
  bool checkboxNoob = false;

  @observable
  bool checkboxHaveModulus = false;

  @observable
  bool checkboxDontHaveModulus = false;

  @observable
  String inputTextAmount;

  @observable
  String inputTextName;

  @observable
  List<String> optionsOperator = ['', '<=', '>='];

  @observable
  String selectedOptionsOperator = '';

  @observable
  TextEditingController inputTextAmountController = TextEditingController();

  @observable
  TextEditingController inputTextNameController = TextEditingController();

  _ManagerControllerBase() {
    manager = _repository.getManager().asObservable();
  }

  @action
  void setSelectedUser(int index) {
    selectedUser = index;
  }

  @action
  List<List<ManagerModel>> getFilters() {
    List<List<ManagerModel>> filters = [
      filteredCondition,
      filteredProject,
      filteredActivity,
      filteredOperationality,
      filteredAmount,
      filteredModulus,
      filteredName,
    ];
    return filters;
  }

  @action
  void setCheckboxComissioned(bool check) {
    checkboxComissioned = check ? true : false;
    filteredCondition = filterCondition();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxDaily(bool check) {
    checkboxDaily = check ? true : false;
    filteredCondition = filterCondition();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxNineNine(bool check) {
    checkboxNineNine = check ? true : false;
    filteredProject = filterProject();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxNineSeven(bool check) {
    checkboxNineSeven = check ? true : false;
    filteredProject = filterProject();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxPilot(bool check) {
    checkboxPilot = check ? true : false;
    filteredActivity = filterActivity();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxMechanic(bool check) {
    checkboxMechanic = check ? true : false;
    filteredActivity = filterActivity();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxAttendant(bool check) {
    checkboxAttendant = check ? true : false;
    filteredActivity = filterActivity();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxDoctor(bool check) {
    checkboxDoctor = check ? true : false;
    filteredActivity = filterActivity();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxInstructor(bool check) {
    checkboxInstructor = check ? true : false;
    filteredOperationality = filterOperationality();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxOperational(bool check) {
    checkboxOperational = check ? true : false;
    filteredOperationality = filterOperationality();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxBasic(bool check) {
    checkboxBasic = check ? true : false;
    filteredOperationality = filterOperationality();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxNoob(bool check) {
    checkboxNoob = check ? true : false;
    filteredOperationality = filterOperationality();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxHaveModulus(bool check) {
    checkboxHaveModulus = check ? true : false;
    filteredModulus = filterModulus();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setCheckboxDontHaveModulus(bool check) {
    checkboxDontHaveModulus = check ? true : false;
    filteredModulus = filterModulus();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setSelectedOptionsOperator(String value) {
    selectedOptionsOperator = value;
    filteredAmount = filterAmount();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setInputTextAmount(String value) {
    inputTextAmount = value;
    filteredAmount = filterAmount();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  void setInputTextName(String value) {
    inputTextName = value;
    filteredName = filterName();
    List<List<ManagerModel>> listFilters = getFilters();
    filteredManager = Filters.joinFilters(listFilters);
  }

  @action
  List<ManagerModel> filterCondition() {
    return Filters.condition(manager, checkboxComissioned, checkboxDaily);
  }

  @action
  List<ManagerModel> filterProject() {
    return Filters.project(manager, checkboxNineNine, checkboxNineSeven);
  }

  @action
  List<ManagerModel> filterActivity() {
    return Filters.activity(manager, checkboxPilot, checkboxMechanic,
        checkboxAttendant, checkboxDoctor);
  }

  @action
  List<ManagerModel> filterOperationality() {
    return Filters.operationality(manager, checkboxInstructor,
        checkboxOperational, checkboxBasic, checkboxNoob);
  }

  @action
  List<ManagerModel> filterAmount() {
    return Filters.amount(manager, selectedOptionsOperator, inputTextAmount);
  }

  @action
  List<ManagerModel> filterModulus() {
    return Filters.modulus(
        manager, checkboxHaveModulus, checkboxDontHaveModulus);
  }

  @action
  List<ManagerModel> filterName() {
    return Filters.name(manager, inputTextName);
  }

  @action
  listUserMissions(context, String fullName) {
    Navigator.of(context).pushNamed('/Missions/' + fullName);
  }

  @action
  Future logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushNamedAndRemoveUntil(
        Modular.initialRoute, ModalRoute.withName(Modular.initialRoute));
  }
}
