import 'package:firebase_auth/firebase_auth.dart';
import 'Login.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';
// NOTE: You don't need 'package:flutter/services.dart' for this code
import 'package:firebase_core/firebase_core.dart';
// IMPORTANT: You MUST generate and import this file to pass options
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // CORRECT WAY TO INITIALIZE FIREBASE
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

// Your MyApp and _MyAppState classes remain the same...


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
            return const LoginPage();
          }
          // If the user is not logged in, show the LoginPage
          return MyHomeApp();
        },
      ),
    );
  }
}

