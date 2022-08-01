import 'package:flutter/material.dart';
import 'package:login_practice/data/join_or_login.dart';
import 'package:login_practice/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<JoinOrLogin>.value(
          value: JoinOrLogin(),
          child: AuthPage() //패키지 이름(코드가 길어서 따로 패키지를 만듦)
      ),
    );
  }
}

