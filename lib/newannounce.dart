import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

late User loggedinuser;

class announcement extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _announcementState createState() => _announcementState();
}

class _announcementState extends State<announcement> {
  final messageTextController = TextEditingController();

  late var sentuser;
  final _firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  //final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  //going to cutout loged in user
  //late User loggedinuser;
  late String messagetext;
  late String gemmurl;

  ///for image uploading
  File? _image;
  Image myIcon = Image.asset('assets/ad.png');

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      ///meke tyyna hamahuttama kapapan
      final ref = storage.ref().child('images/${DateTime.now().toString()}');
      final uploadTask = ref.putFile(File(pickedImage.path));
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      gemmurl = imageUrl;
      _image = File(pickedImage.path);

      setState(() {
        myIcon = Image.asset('pickedImage');
      });
    }
  }

  ///image uploading end
  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async {
    try {
      // final user = await _auth.currentUser();
      ///yata line eka chatgpt code ekk meka gatte uda line eke error ekk ena hinda hrytama scene eka terenne na
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedinuser = user;
        print(loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  ///msg streaming method begin
  ///with the chatgpt code this works

  void messagesstream() async {
    await for (var snapeshot in _firestore
        .collection('announcement')
        .orderBy('timestamp')
        .snapshots()) {
      for (var doc in snapeshot.docs) {
        var data = doc.data();
      }
    }
  }

  ///msg streaming method end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout_outlined),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);

                //Implement logout functionality
              }),
        ],
        title: Text(
          '   Announcements',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kWhatsAppGreen,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ///chatgpt code
            ///this is workingg
            StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('announcement')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data!.docs.reversed;

                  ///my working code end

                  ///chat gpt code begin
                  //final messages = snapshot.data!.docs.reversed;
                  List<messagebuble> messageBubbles = [];
                  for (var message in messages) {
                    final posturl = message['url'];
                    final messageSender = message['sender'];
                    //   final time = message['timestamp'].toString();
                    final currentUser = loggedinuser.email;

                    final messageBubble = messagebuble(
                      msender: messageSender,
                      postlink: posturl,
                      isme: currentUser == messageSender,
                      //time: time,
                    );

                    messageBubbles.add(messageBubble);
                  }

                  ///chatgpt code end

                  return Expanded(
                    child: ListView(
                      reverse: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      children: messageBubbles,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error fetching messages');
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),

            ///chat gpt code end

            Container(
              decoration: kMessageContainerDecoration,
              //child:

              ///chat gpt
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Post your announcements here',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Spacer(),
                      Expanded(
                        child: InkWell(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            backgroundColor: Colors.deepPurpleAccent,
                            radius: 50.0,
                            backgroundImage:
                                _image != null ? FileImage(_image!) : null,
                            child: _image == null
                                ? Icon(
                                    Icons.image,
                                    size: 40.0,
                                    color: Colors.white,
                                  )
                                : Image.file(_image!),
                          ),
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          _firestore.collection('announcement').add({
                            'url': gemmurl,
                            'sender': loggedinuser.email,
                            'timestamp': FieldValue.serverTimestamp(),
                          });
                          setState(() {
                            _image = null;
                          });
                        },
                        child: Text(
                          'Post',
                          style: kSendButtonTextStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              ///chat gpt end

              /*

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
                      radius: 50.0,
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child: /*Image(
                            image: AssetImage('images/ad.png'),
                          ),*/
                          _image == null
                              ? Image.asset('images/ad.png')
                              : Image.file(_image!),

                      /*IconButton(
                              icon: myIcon,
                              onPressed: null,
                            ),*/
                    ),
                  )),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('announcement').add({
                        'url': gemmurl,
                        'sender': loggedinuser.email,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                      setState(() {
                        _image =
                            null; // Set the _image variable to null to remove the image
                      });

                      //Implement send functionality.
                    },
                    child: Text(
                      'Post',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),*/
            ),
          ],
        ),
      ),
    );
  }
}

class messagebuble extends StatelessWidget {
  messagebuble({
    required this.postlink,
    required this.msender,
    required this.isme,
  });
  final String msender;
  final String postlink;
  final bool isme;
  //final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            msender,
            style: TextStyle(
              fontSize: 11.0,
              color: Colors.black54,
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isme
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
            color: isme ? kSenderChatBubbleColor : kReceiverChatBubbleColor,
            child: Container(
              //padding: EdgeInsets.only(left: 20),
              height: 150,
              // width: double.infinity,
              color: Color(0xDBD6EFFF),
              child: Image(
                image: NetworkImage('$postlink'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
