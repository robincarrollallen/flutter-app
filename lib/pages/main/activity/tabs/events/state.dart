import 'package:get/get.dart';
import '/model/activity_list_model.dart';

class EventsState {
  final RxList<ActivityListModel> activityList = <ActivityListModel>[].obs;

  void setActivityList(List<ActivityListModel> list) {
    activityList.value = list;
  }
}
