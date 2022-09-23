
import 'package:analytics_service_interface/analytics_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  getIt.get<AnalyticsServiceInterface>().init();
  
}