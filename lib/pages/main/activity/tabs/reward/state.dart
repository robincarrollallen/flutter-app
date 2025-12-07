import 'package:get/get.dart';
import '/model/dto/activity_record_history_model.dart';

class RewardState {
  final RxInt day = 0.obs;
  final RxInt currentPage = 1.obs;
  final RxBool hasMoreData = true.obs;
  final RxList<RecordList> activityRecordHistoryList = <RecordList>[].obs;

  void setDay(int value) {
    day.value = value;
  }

  void setHasMoreData(bool value) {
    hasMoreData.value = value;
  }

  void setActivityRecordHistoryList(List<RecordList> list) {
    activityRecordHistoryList.value = list;
  }
}
