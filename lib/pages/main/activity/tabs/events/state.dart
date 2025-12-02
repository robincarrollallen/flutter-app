import 'package:flutter_app/model/activity_list_model.dart';
import 'package:get/get.dart';

class EventsState {
  final RxList<ActivityListModel> activityList = <ActivityListModel>[].obs;

  void setActivityList(List<ActivityListModel> list) {
    activityList.value = list;
  }
}
