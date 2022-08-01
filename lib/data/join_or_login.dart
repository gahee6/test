import 'package:flutter/foundation.dart';

class JoinOrLogin extends ChangeNotifier{ //상태가 join인지 login인지 확인 //변경될때마다 데이터를 제공받아 사용한 위젯들은 알림을 받음
  bool _isJoin = false; //기본값은 login

  bool get isJoin => _isJoin;

  void toggle(){ //_isJoin을 True와 False로 번갈아가면서 변경
    _isJoin = !_isJoin;
    notifyListeners(); //알림을 보내줌
  }
}