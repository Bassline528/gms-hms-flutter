library analytics_service;

import 'package:analytics_service_interface/analytics_service.dart';
import 'package:flutter/foundation.dart';
import 'package:huawei_analytics/huawei_analytics.dart';

class HmsAnalyticsService implements AnalyticsServiceInterface {

  late final HMSAnalytics _service;

  @override
  Future<void> init() async {
    _service.setAnalyticsEnabled(!kDebugMode);
  }

  @override
  Future<void> sendEvent(String event, {Map<String, Object?>? parameters}) {
    return _service.onEvent(event, parameters ?? {});
  }
}