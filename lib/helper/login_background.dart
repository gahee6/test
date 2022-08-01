import 'package:flutter/material.dart';
import 'package:login_practice/data/join_or_login.dart';

class LoginBackground extends CustomPainter{

  LoginBackground({required this.isJoin});
  final bool isJoin;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = isJoin?Colors.blue:Color(0xfff18cb2); //..은 Paint()..color = Colors.amber을 한가지 값으로 생각하면됨
    canvas.drawCircle(Offset(size.width*0.5, size.height*0.15), size.height*0.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) { //뒷배경을 다시 그릴지 말지 결정
    return false; //다시 안 그림
  }
}