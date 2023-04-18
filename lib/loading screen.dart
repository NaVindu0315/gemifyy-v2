import 'package:flutter/material.dart';
import 'package:gemifyyv2/dashboard.dart';
import 'package:gemifyyv2/login.dart';

class loadingscreen extends StatefulWidget {
  static String id = 'loadingscreen';

  @override
  State<loadingscreen> createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 300,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => lgin()),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20, color: Color(0xFF43468E)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFACAFF2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
