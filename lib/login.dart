import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:authentication_practice/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    //using provider of authService to create authService variable

    final authService = Provider.of<AuthService>(context);


    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(8),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: ('Email')
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(8),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: ('Password')
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  authService.signInWithEmailAndPassword(
                  emailController.text,
                  passwordController.text);
                },
                child: Text('Login')
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'/register');
                },
                child: Text('Register')
            ),
          ],
        )
    );
  }
}
