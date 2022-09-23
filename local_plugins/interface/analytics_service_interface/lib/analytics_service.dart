library analytics_service_interface;

abstract class AnalyticsServiceInterface {
  Future<void> init();

  Future<void> sendEvent(String name, {Map<String, Object?>? parameters});
}
/// A Calculator.

