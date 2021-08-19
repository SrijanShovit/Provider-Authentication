import 'package:authentication_practice/auth_service.dart';
import 'package:authentication_practice/homescreen.dart';
import 'package:authentication_practice/login.dart';
import 'package:authentication_practice/register.dart';
import 'package:authentication_practice/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //implementing auth_service in main
    //creating multi provider
    
    return MultiProvider(
      providers:[
        Provider<AuthService>(create: (_) => AuthService())
      ],
      child: MaterialApp(
        title: 'Flutter Auth Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
        },
      ),
    );
  }
}



