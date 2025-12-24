import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../model/tenant_info_model.dart';
import 'state.dart';

class TenantLogic extends GetxController {
  final state = TenantState();

  @override
  void onReady() {
    super.onReady();

    _loadTenantData();
  }

  /// loading Tenant Data
  Future<TenantInfoModel> _loadTenantData() async {
    final String jsonString = await rootBundle.loadString('assets/mock/tenant_info.json'); // 读取 JSON 文件
    final jsonMap = json.decode(jsonString); // 解析 JSON 数据
    final tenantInfo = TenantInfoModel.fromJson(jsonMap); // 生成列表数据
    state.setTenantInfo(tenantInfo);
    return tenantInfo;
  }
}