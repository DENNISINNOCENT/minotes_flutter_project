
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'constants/routes.dart';
import 'services/auth/auth_service.dart';
import 'views/login_view.dart';
import 'views/notes_view.dart';
import 'views/register_view.dart';
import 'views/verify_email_view.dart';
import 'dart:developer' as devtools show log;


void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute:(context) => const NotesView(),
        verifyEmailRoute:(context) =>  const VerifyEmailView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        //firebase initialization
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.firebase().currentUser;
              if (user != null) {
                if (user.isEmailVerified) {
                  devtools.log('Email is verified'.toString());
                } else {
                  return const VerifyEmailView();
                }
              } else {
                return const LoginView();
              }
              return const NotesView();

            default:
              return const Text('loading');
          }
        });
  }
}
