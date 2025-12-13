import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '/model/tenant_info_model.dart';
import '/store/layout/state.dart';
import 'state.dart';

class CommonLogic extends GetxController {
  final state = CommonState(); // 全局数据状态
  final layoutState = LayoutState();

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