import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'chat_screen.dart';
import 'dashboard.dart';
import 'gemlistview.dart';

//////menna mehema display krpm kelinma aye pakak krnna yanna epa
///${data!['username']}

late User loggedinuser;
late String client;
late String age;
late String username;
late String address;
late String dob;
late String mobile;

void main() {
  runApp(userdetails());
}

class userdetails extends StatefulWidget {
  static String id = 'userdetails';
  late String qrdata;
  @override
  State<userdetails> createState() => _userdetailsState();
}

class _userdetailsState extends State<userdetails> {
  GlobalKey globalKey = new GlobalKey();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  ///going to combine thse two methofs
  ///combined method start
  /*
  void getcurrentuser() async {
    try {
      // final user = await _auth.currentUser();
      ///yata line eka chatgpt code ekk meka gatte uda line eke error ekk ena hinda hrytama scene eka terenne na
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedinuser = user;
        client = loggedinuser.email!;
        final documents = await _firestore.collection('users').get();
        final documentNames = documents.docs
            .where((doc) => doc.get('email') == client)
            .map((doc) => doc.id)
            .toList();
        // Use the documentNames list here
        for (final documentId in documentNames) {
          final documentSnapshot =
              await _firestore.collection('users').doc(documentId).get();
          final data = documentSnapshot
              .data(); // a Map<String, dynamic> containing the document data
          age = data!['username'];
          username = data!['username'];
          mobile = data!['mobile'];
          address = data!['address'];
          dob = data!['dob'];
          print(age);
          print(mobile);
          print(username);

          print(address);
          print(dob);

          // extract the age value from the data map
          // use the age value here to display or process the document data
        }

        ///i have to call the getdatafrm the function here and parse client as a parameter
      }
    } catch (e) {
      print(e);
    }
  }
*/
  ///comibined method end

  void getcurrentuser() async {
    try {
      // final user = await _auth.currentUser();
      ///yata line eka chatgpt code ekk meka gatte uda line eke error ekk ena hinda hrytama scene eka terenne na
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedinuser = user;
        client = loggedinuser.email!;

        ///i have to call the getdatafrm the function here and parse client as a parameter

        print(loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  ///getting data from the firebase functon
/*  Future<void> getDataFromFirebase(String cliet) async {
    final client = cliet;
    final documents = await _firestore.collection('users').get();
    final documentNames = documents.docs
        .where((doc) => doc.get('email') == client)
        .map((doc) => doc.id)
        .toList();
    // Use the documentNames list here
    for (final documentId in documentNames) {
      final documentSnapshot =
          await _firestore.collection('users').doc(documentId).get();
      final data = documentSnapshot
          .data(); // a Map<String, dynamic> containing the document data
      age = data!['age'];
      username = data['username'];
      mobile = data['mobile'];
      address = data['address'];
      dob = data['dob'];

      // extract the age value from the data map
      // use the age value here to display or process the document data
    }
  }*/

  ///getting data from the firebase function end
  ///
  ///
  ///
  /// qr function

  /// qr function end

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: Scaffold(
        backgroundColor: Colors.purple.shade100,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          toolbarHeight: 70,
          centerTitle: true,
          backgroundColor: Color(0xFFA888EB),
          // The title text which will be shown on the action bar
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  client,
                  style: TextStyle(
                      fontSize: 31,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child:

                  ///stream builder
                  StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(client)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;

                return
                    /*Column(
                  children: [
                    Text('Username: ${data!['username']}'),
                    Text('DOB: ${data!['dob']}'),
                    Text('Address: ${data!['address']}'),
                  ],
                );*/
                    ///this complete  container has to be returned

                    Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                        child: CircleAvatar(
                          backgroundColor: Colors.purple,
                          minRadius: 70.5,
                          child: CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  //AssetImage('images/g.png'),
                                  NetworkImage('${data!['url']}')),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0), // set the padding
                        decoration: BoxDecoration(
                          color: Colors
                              .purple.shade300, // set the background color
                          borderRadius: BorderRadius.circular(
                              10.0), // set the border radius
                        ),
                        height: 60,
                        width: double.infinity,

                        child:

                            ///username row
                            Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Username :',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  height: 2,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                //////username variable
                                // username,
                                //Text('Username: ${data!['username']}'),
                                '${data!['username']}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  height: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /////////
                      Container(
                        padding: EdgeInsets.all(8.0), // set the padding
                        decoration: BoxDecoration(
                          color: Colors
                              .purple.shade300, // set the background color
                          borderRadius: BorderRadius.circular(
                              10.0), // set the border radius
                        ),
                        height: 60,
                        width: double.infinity,
                        //color: const Color(0xDBD6EFFF),
                        child:

                            ///username row
                            Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                'email :',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  height: 2,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                //////email variable
                                client,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  height: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///mobile
                      Container(
                        padding: EdgeInsets.all(8.0), // set the padding
                        decoration: BoxDecoration(
                          color: Colors
                              .purple.shade300, // set the background color
                          borderRadius: BorderRadius.circular(
                              10.0), // set the border radius
                        ),
                        height: 60,
                        width: double.infinity,
                        //color: const Color(0xDBD6EFFF),
                        child:

                            ///username row
                            Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Mobile :',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  height: 2,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                //////mobile variable
                                '${data!['mobile']}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  height: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /////////
                      ///address
                      Container(
                        padding: EdgeInsets.all(6.0), // set the padding
                        decoration: BoxDecoration(
                          color: Colors
                              .purple.shade300, // set the background color
                          borderRadius: BorderRadius.circular(
                              10.0), // set the border radius
                        ),
                        height: 60,
                        width: double.infinity,
                        // color: const Color(0xDBD6EFFF),
                        child:

                            ///username row
                            Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Address :',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  height: 2,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                //////username variable
                                '${data!['address']}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  height: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///dob
                      Container(
                        height: 60,
                        width: double.infinity,
                        padding: EdgeInsets.all(8.0), // set the padding
                        decoration: BoxDecoration(
                          color: Colors
                              .purple.shade300, // set the background color
                          borderRadius: BorderRadius.circular(
                              10.0), // set the border radius
                        ),
                        //: const Color(0xDBD6EFFF),
                        child:

                            ///username row
                            Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Date of Birth :',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  height: 2,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                //////username variable
                                '${data!['dob']}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  height: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          QrImage(
                            key: GlobalKey(),

                            data:

                                //qrr,
                                'Name - ${data?['username']}\n'
                                'email - $client\n'
                                'mobile - ${data?['mobile']}\n'
                                'address - ${data?['address']}\n'
                                'Date of Birth - ${data?['dob']}',
                            // data: 'Name: ${data!['username']}\nAge:${data!['age']}\nDOB: ${data!['dob']}\nAddress: ${data!['address']}\nMobile: ${data!['mobile']}',
                            version: QrVersions.auto,

                            size: 200.0,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () async {
                              ///define the qr download file
                            },
                            child: Text('Download QR Code'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => dashboard()),
                              );
                              // Handle Home button tap
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.home),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen()),
                              );
                              // Handle Messages button tap
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.message),
                                Text(
                                  'Messages',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => gemlist()),
                              );

                              // Handle Gem Inventory button tap
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.inventory),
                                Text(
                                  'Gem Inventory',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => userdetails()),
                              );
                              // Handle Profile button tap
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.person),
                                Text(
                                  'Profile',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      /////////
                      /////////
                      /////////
                    ],
                  ),
                );

                ///container that should  be retutned end
              }

              return CircularProgressIndicator();
            },
          )

              ///end

              ),
        ),
      ),
    );
  }
}
/* print(
                                'Name - ${data?['username']}\n'
                                'email - $client\n'
                                'mobile - ${data?['mobile']}\n'
                                'address - ${data?['address']}\n'
                                'Date of Birth - ${data?['dob']}',
                              );*/
/*final boundary = _qrKey.currentContext!
                                  .findRenderObject() as RenderRepaintBoundary;

                              // Render QR code to image data
                              final image =
                                  await boundary.toImage(pixelRatio: 2.0);
                              var imageData = await image.toByteData(
                                  format: ImageByteFormat.png);

                              // Get documents directory
                              final directory =
                                  await getApplicationDocumentsDirectory();

                              // Generate QR code as image data
                              imageData =
                                  imageData!.buffer.asUint8List() as ByteData?;

                              // Save image data to file
                              final file =
                                  await File('${directory.path}/qr.png')
                                      .create();
                              await file.writeAsBytes(imageData as List<int>);

                              // Show a snackbar to indicate that the QR code was saved
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'QR code saved to documents directory'),
                                  duration: Duration(seconds: 3),
                                ),
                              );*/
