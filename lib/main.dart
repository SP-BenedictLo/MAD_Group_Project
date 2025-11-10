import 'package:firebase_auth/firebase_auth.dart';
import 'Login.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Use a StreamBuilder to listen for authentication state changes
      home: StreamBuilder<User?>( //Listens to FirebaseAuth.instance.authStateChanges(), which emits events whenever the user's authentication state changes (login, logout, etc.).
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Show a loading indicator while checking the authentication status
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // If the user is logged in, show the MainPage
          if (snapshot.hasData) {
            return MyHomeApp();
          }
          // If the user is not logged in, show the LoginPage
          return const LoginPage();
        },
      ),
    );
  }
}

