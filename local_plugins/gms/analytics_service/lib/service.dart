import 'package:analytics_service_interface/analytics_service.dart';
import 'src/gms_analytics.dart';

export 'package:analytics_service_interface/analytics_service.dart';

abstract class AnalyticsServiceProvider {
  static AnalyticsServiceInterface getAnalyticsService() =>
      GmsAnalyticsService();
}