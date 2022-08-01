import 'package:flutter/material.dart';
import 'package:login_practice/data/join_or_login.dart';
import 'package:login_practice/helper/login_background.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; //핸드폰 화면 사이즈를 가지고 옴 //final을 사용하면 값을 변경할 수 없음

    return Scaffold(
      body: Stack(
        alignment: Alignment.center, //가운데 정렬
        children: <Widget>[
          CustomPaint(
            size: size,
            painter: LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin),
          ),
          Column( //2Layer
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _logoImage(), //사진 코드
              Stack( //input Form과 버튼을 합쳐줌
                children: <Widget>[
                  _inputForm(size), //input Form 코드
                  _authButton(size), //버튼 코드
                ],
              ),
              Container( //맨 밑에 글씨와 input Form 사이를 띄우기 위한 상자
                height: size.height * 0.1,
              ),
              TextButton(
                child: Text("Don't Have an Account? Create One"),
              onPressed: (){
                  JoinOrLogin joinOrLogin = Provider.of<JoinOrLogin>(context);
                  joinOrLogin.toggle();
              },
              ), //Text
              Container( //맨 밑에 글씨를 띄우기 위한 상자 //SizedBox()도 가능
                height: size.height * 0.05, //핸드폰 화면 높이의 5%만큼 값을 높이로 설정
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _logoImage(){
    return  Expanded( //남는 공간을 다 차지함
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 24, right: 24,),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/alpaca.jpg"),
          ),
        ),
      ),
    );
  }

  Widget _authButton(Size size){
    return Positioned( //버튼 위치 조정
      left: size.width*0.15,
      right: size.width*0.15,
      bottom: 0,
      child: SizedBox( //높이 설정을 위해 사용
        height: 50.0,
        child: ElevatedButton( child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20,), ),
            style: ButtonStyle(backgroundColor: MaterialStateProperty),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {
              if(_formKey.currentState!.validate()){ //강의와 다르게 ! 추가
                print(_passwordController.text.toString()); //로그인하면 콘솔창에 비번이 출력됨
              }
            }),
      ),
    );
  }

  Widget _inputForm(Size size){ //input Form을 만든 코드
    return Padding( //input Form 주위에 여백주기(바깥쪽)
      padding: EdgeInsets.all(size.width*0.05), //all은 전체적으로 여백을 줌
      child: Card(
        shape: RoundedRectangleBorder( //모서리를 둥근 모양으로 바꾸기
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 6, //input Form 밑에 그림자 주기
        child: Padding( //안쪽 여백주기
          padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 32,),
          child: Form( //id, 비번, 텍스트가 있는 흰색 박스
              key: _formKey, //formKey를 통해서 사용자가 입력하는 정보를 가져올 수 있도록 함
              child: Column( //세로 정렬
                crossAxisAlignment: CrossAxisAlignment.start, //Forgot부분 왼쪽으로 정렬
                children: <Widget>[
                  TextFormField( //id 입력
                    controller: _emailController, //controller를 통해서 id를 가져옴
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "Email",
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){ //강의와 다르게 !를 붙임(why)
                        return "Please input correct Email."; //공백이면 이 문장을 출력
                      }
                      return null;
                    },//사용자가 입력한 정보가 맞는지 확인
                  ),
                  TextFormField( //비번 입력
                    obscureText: true, //입력하면 숫자가 점으로 가려짐
                    controller: _passwordController, //controller를 통해서 비번을 가져옴
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password",
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return "Please input correct password.";
                      }
                      return null;
                    },
                  ),
                  Container(height: 8,),
                  Text("Forgot Password"),
                ],
              )),
        ),
      ),
    );
  }
}
