library push_service;
import 'package:push_service_interface/push_service_interface.dart';
import 'package:huawei_push/huawei_push.dart';

class PushService implements PushServiceInterface {
  String _token = ''; 
  @override
  getToken() { //TODO: implement on Error
    Push.getTokenStream.listen((event) { 
      _token = event;
    });
    Push.getToken("");
    return _token;
  }

  @override
  Future<void> init() async {
    Push.onMessageReceivedStream.listen(_onMessageReceived );
  }

  void _onMessageReceived(RemoteMessage remoteMessage) {
    print(remoteMessage.getData);
  }

}

