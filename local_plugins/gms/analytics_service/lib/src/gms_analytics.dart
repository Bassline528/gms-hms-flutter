library analytics_service;
import 'package:analytics_service_interface/analytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class GmsAnalyticsService implements AnalyticsServiceInterface {

  @override
  Future<void> init() async {
    await Firebase.initializeApp();
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(!kDebugMode);
  }

  @override
  Future<void> sendEvent(String name, {Map<String, Object?>? parameters}) {
    return FirebaseAnalytics.instance.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}