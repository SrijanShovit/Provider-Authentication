import 'package:authentication_practice/auth_service.dart';
import 'package:authentication_practice/homescreen.dart';
import 'package:authentication_practice/login.dart';
import 'package:authentication_practice/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //checking user is authenticated or not
    final authService = Provider.of<AuthService>(context);
    //StreamBuilder to return a stream of user
    return StreamBuilder<User?>(
      stream: authService.user,
        builder: (_ , AsyncSnapshot<User?> snapshot) {
        //checking about snapshot
          if (snapshot.connectionState == ConnectionState.active){
            final User? user = snapshot.data;
            return user == null? LoginScreen() : HomeScreen();
          }
          else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
    return Container();
  }
}
