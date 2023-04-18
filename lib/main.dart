import 'package:flutter/material.dart';
import 'package:gemifyyv2/chat_screen.dart';
import 'package:gemifyyv2/dashboard.dart';
import 'package:gemifyyv2/loading%20screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gemifyyv2/login.dart';
import 'package:gemifyyv2/signup.dart';
import 'package:gemifyyv2/userdetails.dart';
import 'authprovider.dart';
import 'firebase_options.dart';
import 'userdetails.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: ChangeNotifierProvider(
        create: (context) => AuthProvider(), child: strt()),
  ));
}

class strt extends StatefulWidget {
  @override
  State<strt> createState() => _strtState();
}

class _strtState extends State<strt> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          if (authProvider.isLoggedIn) {
            return dashboard();
          } else {
            return loadingscreen();
          }
        },
      ),

      //loadingscreen(),
      //initialRoute: loadingscreen.id,
      /*  routes: {
        dashboard.id: (context) => dashboard(),
        gemifysign.id: (context) => gemifysign(),
        lgin.id: (context) => lgin(),
        userdetails.id: (context) => userdetails(),
        ChatScreen.id: (context) => ChatScreen(),
      },*/
    );
  }
}
