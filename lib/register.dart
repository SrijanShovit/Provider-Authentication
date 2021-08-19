import 'package:authentication_practice/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
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
                onPressed: () async {
                  await authService.createUserWithEmailAndPassword(
                  emailController.text,
                  passwordController.text);
                  Navigator.pop(context);
                },
                child: Text('Register')
            ),
          ],
        )
    );
  }
}
