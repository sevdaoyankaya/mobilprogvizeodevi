import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage> {
  String userName;
  String password;

  final degerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: degerKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kullanıcı Adı",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    userName = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Şifre",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    password = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: Colors.purple,
                      child: Text("Üye Ol"),
                      textColor: Colors.black,
                      onPressed: () {
                        debugPrint("Butona Basıldı");
                        Navigator.pushNamed(context, '/uyeol');
                      },
                    ),
                    MaterialButton(
                      color: Colors.purple,
                      child: Text("Şifremi Unuttum"),
                      textColor: Colors.black,
                      onPressed: () {
                        debugPrint("Butona Basıldı");
                        Navigator.pushNamed(context, '/sifremiunuttum');
                      },
                    ),
                  ],
                ),
                RaisedButton(
                  color: Colors.purple,
                  child: Text("Giriş"),
                  textColor: Colors.black,
                  onPressed: () {
                    degerKey.currentState.save();
                    debugPrint("userName : $userName , password : $password");
                    if (userName == "demo" && password == "demo") {
                      debugPrint("Giriş başarılı.");

                      Navigator.of(context).pushReplacementNamed('/anasayfa');
                    } else {
                      debugPrint("Kullanıcı Adı ya da Şifre yanlış");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
