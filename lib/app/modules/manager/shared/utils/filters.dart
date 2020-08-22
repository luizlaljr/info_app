import 'package:info_app/app/modules/manager/shared/models/manager_model.dart';
import 'package:mobx/mobx.dart';

class Filters {
  static List<ManagerModel> joinFilters(List<List<ManagerModel>> listFilters) {
    List<ManagerModel> result;
    List<List<ManagerModel>> filters = listFilters;
    List<List<ManagerModel>> managerList = [];
    filters.forEach(
      (element) {
        if (element != null) {
          if (element.isNotEmpty) {
            managerList.add(element);
          }
        }
      },
    );
    Map map = Map();
    for (List l in managerList) {
      l.forEach(
          (item) => map[item] = map.containsKey(item) ? (map[item] + 1) : 1);
    }

    result = map.keys
        .where((key) => map[key] == managerList.length)
        .toList()
        .cast<ManagerModel>();
    return result;
  }

  static List<ManagerModel> condition(
      manager, checkboxComissioned, checkboxDaily) {
    List<ManagerModel> resultList;
    List<ManagerModel> managerList = manager.value;
    var managerIterable;
    var comissioned = checkboxComissioned;
    var daily = checkboxDaily;
    if (managerList != null) {
      managerIterable = managerList.where((manager) {
        if (!comissioned && !daily) {
          return false;
        }
        if (comissioned && !daily) {
          return manager.condition == true;
        }
        if (!comissioned && daily) {
          return manager.condition == false;
        }
        return true;
      });
      resultList = managerIterable.toList();
    }
    return resultList;
  }

  static List<ManagerModel> project(
      manager, checkboxNineNine, checkboxNineSeven) {
    List<ManagerModel> resultList;
    List<ManagerModel> managerList = manager.value;
    var managerIterable;
    var nineNine = checkboxNineNine;
    var nineSeven = checkboxNineSeven;
    if (managerList != null) {
      managerIterable = managerList.where((manager) {
        if (!nineNine && !nineSeven) {
          return false;
        }
        if (nineNine && !nineSeven) {
          return (manager.project == 'C-99' || manager.project == 'Both');
        }
        if (!nineNine && nineSeven) {
          return (manager.project == 'C-97' || manager.project == 'Both');
        }
        return true;
      });
      resultList = managerIterable.toList();
    }
    return resultList;
  }

  static List<ManagerModel> activity(manager, checkboxPilot, checkboxMechanic,
      checkboxAttendant, checkboxDoctor) {
    List<ManagerModel> resultList;
    List<ManagerModel> managerList = manager.value;
    var managerIterable;
    var pilot = checkboxPilot;
    var mechanic = checkboxMechanic;
    var attendant = checkboxAttendant;
    var doctor = checkboxDoctor;
    if (managerList != null) {
      managerIterable = managerList.where((manager) {
        if (!pilot && !mechanic && !attendant && !doctor) {
          return false;
        }
        if (pilot && !mechanic && !attendant && !doctor) {
          return manager.activity == 'P';
        }
        if (!pilot && mechanic && !attendant && !doctor) {
          return manager.activity == 'M';
        }
        if (!pilot && !mechanic && attendant && !doctor) {
          return manager.activity == 'C';
        }
        if (!pilot && !mechanic && !attendant && doctor) {
          return manager.activity == 'D';
        }
        if (pilot && mechanic && !attendant && !doctor) {
          return (manager.activity == 'P' || manager.activity == 'M');
        }
        if (pilot && !mechanic && attendant && !doctor) {
          return (manager.activity == 'P' || manager.activity == 'C');
        }
        if (pilot && !mechanic && !attendant && doctor) {
          return (manager.activity == 'P' || manager.activity == 'D');
        }
        if (!pilot && mechanic && attendant && !doctor) {
          return (manager.activity == 'M' || manager.activity == 'C');
        }
        if (!pilot && mechanic && !attendant && doctor) {
          return (manager.activity == 'M' || manager.activity == 'D');
        }
        if (!pilot && !mechanic && attendant && doctor) {
          return (manager.activity == 'C' || manager.activity == 'D');
        }
        if (pilot && mechanic && attendant && !doctor) {
          return (manager.activity == 'P' ||
              manager.activity == 'M' ||
              manager.activity == 'C');
        }
        if (pilot && mechanic && !attendant && doctor) {
          return (manager.activity == 'P' ||
              manager.activity == 'M' ||
              manager.activity == 'D');
        }
        if (!pilot && mechanic && attendant && doctor) {
          return (manager.activity == 'M' ||
              manager.activity == 'C' ||
              manager.activity == 'D');
        }
        if (pilot && !mechanic && attendant && doctor) {
          return (manager.activity == 'P' ||
              manager.activity == 'C' ||
              manager.activity == 'D');
        }
        return true;
      });
      resultList = managerIterable.toList();
    }
    return resultList;
  }

  static List<ManagerModel> operationality(ObservableFuture manager,
      checkboxInstructor, checkboxOperational, checkboxBasic, checkboxNoob) {
    List<ManagerModel> resultList;
    List<ManagerModel> managerList = manager.value;
    var managerIterable;
    var intructor = checkboxInstructor;
    var operational = checkboxOperational;
    var basic = checkboxBasic;
    var noob = checkboxNoob;
    if (managerList != null) {
      managerIterable = managerList.where((manager) {
        if (!intructor && !operational && !basic && !noob) {
          return false;
        }
        if (intructor && !operational && !basic && !noob) {
          return manager.operationality == 'IN';
        }
        if (!intructor && operational && !basic && !noob) {
          return manager.operationality == 'OP' ||
              manager.operationality == 'PO';
        }
        if (!intructor && !operational && basic && !noob) {
          return manager.operationality == 'PB';
        }
        if (!intructor && !operational && !basic && noob) {
          return manager.operationality == 'AL';
        }
        if (intructor && operational && !basic && !noob) {
          return (manager.operationality == 'IN' ||
              manager.operationality == 'OP' ||
              manager.operationality == 'PO');
        }
        if (intructor && !operational && basic && !noob) {
          return (manager.operationality == 'IN' ||
              manager.operationality == 'PB');
        }
        if (intructor && !operational && !basic && noob) {
          return (manager.operationality == 'IN' ||
              manager.operationality == 'AL');
        }
        if (!intructor && operational && basic && !noob) {
          return (manager.operationality == 'OP' ||
              manager.operationality == 'PO' ||
              manager.operationality == 'PB');
        }
        if (!intructor && operational && !basic && noob) {
          return (manager.operationality == 'OP' ||
              manager.operationality == 'PO' ||
              manager.operationality == 'AL');
        }
        if (!intructor && !operational && basic && noob) {
          return (manager.operationality == 'PB' ||
              manager.operationality == 'AL');
        }
        if (intructor && operational && basic && !noob) {
          return (manager.operationality == 'IN' ||
              manager.operationality == 'OP' ||
              manager.operationality == 'PO' ||
              manager.operationality == 'PB');
        }
        if (intructor && operational && !basic && noob) {
          return (manager.operationality == 'IN' ||
              manager.operationality == 'OP' ||
              manager.operationality == 'PO' ||
              manager.operationality == 'AL');
        }
        if (!intructor && operational && basic && noob) {
          return (manager.operationality == 'OP' ||
              manager.operationality == 'PO' ||
              manager.operationality == 'PB' ||
              manager.operationality == 'AL');
        }
        if (intructor && !operational && basic && noob) {
          return (manager.operationality == 'IN' ||
              manager.operationality == 'PB' ||
              manager.operationality == 'AL');
        }
        return true;
      });
      resultList = managerIterable.toList();
    }
    return resultList;
  }

  static List<ManagerModel> amount(ObservableFuture manager,
      String selectedOptionsOperator, String inputTextAmount) {
    List<ManagerModel> resultList;
    List<ManagerModel> managerList = manager.value;
    var managerIterable;
    int amount = inputTextAmount.isEmpty ? -1 : int.parse(inputTextAmount);
    String selectedOperator = selectedOptionsOperator;
    if (managerList != null) {
      managerIterable = managerList.where((manager) {
        if (selectedOperator.isEmpty || amount < 0) return false;
        if (selectedOperator == '>=') return manager.prevision - manager.amount >= amount;
        if (selectedOperator == '<=') return manager.prevision - manager.amount <= amount;
        return true;
      });
      resultList = managerIterable.toList();
    }
    return resultList;
  }

  static List<ManagerModel> modulus(
      manager, checkboxHaveModulus, checkboxDontHaveModulus) {
    List<ManagerModel> resultList;
    List<ManagerModel> managerList = manager.value;
    var managerIterable;
    var haveModulus = checkboxHaveModulus;
    var dontHaveModulus = checkboxDontHaveModulus;
    if (managerList != null) {
      managerIterable = managerList.where((manager) {
        if (!haveModulus && !dontHaveModulus) {
          return false;
        }
        if (haveModulus && !dontHaveModulus) {
          return manager.condition == true && manager.modulus == true;
        }
        if (!haveModulus && dontHaveModulus) {
          return manager.condition == true && manager.modulus == false;
        }
        return true;
      });
      resultList = managerIterable.toList();
    }
    return resultList;
  }

  static List<ManagerModel> name(ObservableFuture manager, String inputTextName){
    List<ManagerModel> resultList;
    List<ManagerModel> managerList = manager.value;
    var managerIterable;
    String name = inputTextName;
    if (managerList != null) {
      managerIterable = managerList.where((manager) {
        if (name.isEmpty) {
          return false;
        }
        return manager.name.contains(name);
      });
      resultList = managerIterable.toList();
    }
    return resultList;
  }
}
