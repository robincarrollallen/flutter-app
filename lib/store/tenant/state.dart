import 'package:get/get.dart';
import '/model/tenant_info_model.dart';

class TenantState {
  final tenantInfo = TenantInfoModel().obs;

  void setTenantInfo(TenantInfoModel info) {
    tenantInfo.value = info;
  }
}