import 'package:info_app/app/modules/home/shared/models/mission_model.dart';
import 'package:mobx/mobx.dart';

class Filters {
  static List<MissionModel> joinFilters(List<List<MissionModel>> listFilters) {
    List<MissionModel> result;
    List<List<MissionModel>> filters = listFilters;
    List<List<MissionModel>> missionsList = [];
    filters.forEach(
      (element) {
        if (element != null) {
          if (element.isNotEmpty) {
            missionsList.add(element);
          }
        }
      },
    );
    Map map = Map();
    for (List l in missionsList) {
      l.forEach(
          (item) => map[item] = map.containsKey(item) ? (map[item] + 1) : 1);
    }

    result = map.keys
        .where((key) => map[key] == missionsList.length)
        .toList()
        .cast<MissionModel>();
    return result;
  }

  static List<MissionModel> kind(
      missions, checkboxMissionOrder, checkboxServiceOrder) {
    List<MissionModel> resultList;
    List<MissionModel> missionsList = missions.value;
    var missionsIterable;
    var missionOrder = checkboxMissionOrder;
    var serviceOrder = checkboxServiceOrder;
    if (missionsList != null) {
      missionsIterable = missionsList.where((missions) {
        if (!missionOrder && !serviceOrder) {
          return false;
        }
        if (missionOrder && !serviceOrder) {
          return missions.kind == 'OM';
        }
        if (!missionOrder && serviceOrder) {
          return missions.kind == 'OS';
        }
        return true;
      });
      resultList = missionsIterable.toList();
    }
    return resultList;
  }

  static List<MissionModel> number(ObservableFuture missions, String inputTextNumber){
    List<MissionModel> resultList;
    List<MissionModel> missionsList = missions.value;
    var missionsIterable;
    String number = inputTextNumber;
    if (missionsList != null) {
      missionsIterable = missionsList.where((missions) {
        return missions.number.contains(number);
      });
      resultList = missionsIterable.toList();
    }
    return resultList;
  }

  static List<MissionModel> locale(ObservableFuture missions, String inputTextLocale){
    List<MissionModel> resultList;
    List<MissionModel> missionsList = missions.value;
    var missionsIterable;
    String locale = inputTextLocale;
    if (missionsList != null) {
      missionsIterable = missionsList.where((missions) {
        return missions.locale.contains(locale);
      });
      resultList = missionsIterable.toList();
    }
    return resultList;
  }

  static List<MissionModel> date(ObservableFuture missions, String inputTextDate){
    List<MissionModel> resultList;
    List<MissionModel> missionsList = missions.value;
    var missionsIterable;
    String date = inputTextDate;
    if (missionsList != null) {
      missionsIterable = missionsList.where((missions) {
        return missions.start.contains(date);
      });
      resultList = missionsIterable.toList();
    }
    return resultList;
  }
}
