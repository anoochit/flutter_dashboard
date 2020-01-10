import 'package:flutter/material.dart';
import 'package:flutter_dashboard/services/auth.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // login field variable
  TextEditingController usernameTextField = new TextEditingController();
  TextEditingController passwordTextField = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          width: 320,
          height: 280,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: <Widget>[
              Text(
                "SignIn",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: usernameTextField,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.account_circle),
                ),
              ),
              TextFormField(
                controller: passwordTextField,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.verified_user),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    hoverColor: Theme.of(context).primaryColorLight,
                    elevation: 1.0,
                    child: Text("SignIn"),
                    onPressed: () {
                      // TODO: SignIn button action
                      debugPrint("user = " +
                          usernameTextField.text.toString() +
                          "pass = " +
                          passwordTextField.text.toString());
                      // TODO: Set preference
                      userAuth(
                              user: usernameTextField.text,
                              pass: passwordTextField.text)
                          .then((result) {
                        debugPrint("auth result = " + result.toString());
                        if (result == true) {
                          // TODO: navigate to home
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage()));
                        }
                      });
                    },
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  RaisedButton(
                    hoverColor: Theme.of(context).primaryColorLight,
                    elevation: 1.0,
                    child: Text("Reset"),
                    onPressed: () {
                      // TODO: Cancel button action
                      usernameTextField.clear();
                      passwordTextField.clear();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
