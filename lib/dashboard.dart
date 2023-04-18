import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gemifyyv2/addgem_page.dart';
import 'package:gemifyyv2/gemlistview.dart';
import 'package:gemifyyv2/loading%20screen.dart';
import 'package:gemifyyv2/userdetails.dart';
import 'drawer.dart';
import 'userdetails.dart';
import 'chat_screen.dart';

import 'newannounce.dart';
import 'authprovider.dart';

late User loggedinuser;
late String client;

void main() {
  runApp(dashboard());
}

class dashboard extends StatefulWidget {
  static String id = 'dashboard';

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  int _selectedIndex = 0;
  static List<Widget> _screens = [
    dashboard(),
    ChatScreen(),
    AddGemPage(),
    userdetails(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        client = loggedinuser.email!;

        ///i have to call the getdatafrm the function here and parse client as a parameter

        print(loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(client)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Scaffold(
                resizeToAvoidBottomInset: false,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Color(0xFFA888EB),
                  onPressed: () {},
                  tooltip: 'Increment',

                  ///rounded item near the navigation bar
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 10.0,
                        color: Colors.white,
                      ),
                      Transform.scale(
                        scale: 0.9,
                        child: Image.asset('images/gem.png'),
                      ),
                    ],
                  ),

                  ///a hutta iwr wenne methanin
                  elevation: 0,
                ),

                ///navigation bar eka

                /*  bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Color.fromRGBO(0, 0, 139, 1.0),
                  selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  backgroundColor: Color(0xFFFACAFF2),
                  onTap: _onItemTapped,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      label: _selectedIndex == 0 ? 'Home' : 'Home',
                      icon: Icon(
                        Icons.home_filled,
                        color: _selectedIndex == 0
                            ? Colors.blue
                            : Color.fromRGBO(0, 0, 139, 1.0),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: _selectedIndex == 1 ? 'Message' : 'Message',
                      icon: Icon(
                        Icons.message_outlined,
                        color: _selectedIndex == 1
                            ? Colors.blue
                            : Color.fromRGBO(0, 0, 139, 1.0),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: _selectedIndex == 2 ? 'Add' : 'Add',
                      icon: Icon(
                        Icons.add,
                        color: _selectedIndex == 2
                            ? Colors.blue
                            : Color.fromRGBO(0, 0, 139, 1.0),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: _selectedIndex == 3 ? 'Profile' : 'Profile',
                      icon: Icon(
                        Icons.person_2_outlined,
                        color: _selectedIndex == 3
                            ? Colors.blue
                            : Color.fromRGBO(0, 0, 139, 1.0),
                      ),
                    ),
                  ],
                ),*/

                ///navigation bar eka iwrii
                ///drawer
                drawer: Drawer(
                  width: 300,
                  child: Container(
                    color: Color(0xDBD6E5FF), //color of list tiles
                    // Add a ListView to ensures the user can scroll
                    child: ListView(
                      // Remove if there are any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        UserAccountsDrawerHeader(
                          decoration: BoxDecoration(
                            color: Color(0xFFD1D3FF), //color of drawer header
                          ),
                          accountName: Text(
                            '${data!['username']}',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 20,
                            ),
                          ),
                          accountEmail: Text(
                            client,
                            style:
                                TextStyle(color: Colors.indigo, fontSize: 17),
                          ),
                          currentAccountPicture: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage('${data!['url']}'),
                          ),
                        ),

                        //Home
                        ListTile(
                          leading: Image.asset('assets/Home.png'),
                          title: const Text('Home',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 17)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => dashboard()),
                            );
                          },
                        ),
                        //Inventory
                        ListTile(
                          leading: Image.asset('assets/Inventory.png'),
                          title: const Text('Inventory',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 17)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => gemlist()),
                            );
                          },
                        ),
                        //Announcement
                        ListTile(
                          leading: Image.asset('assets/Announcement.png'),
                          title: const Text('Announcement',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 17)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => announcement()),
                            );
                          },
                        ),
                        //messages
                        ListTile(
                          leading: Image.asset('assets/Msgs.png'),
                          title: const Text('Messeges',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 17)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen()),
                            );
                          },
                        ),
                        //Profile
                        ListTile(
                          leading: Image.asset('assets/Profile.png'),
                          title: const Text('Profile',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 17)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => userdetails()),
                            );
                          },
                        ),
                        //Dark mode
                        ListTile(
                          trailing: Image.asset('assets/Switch.png'),
                          title: const Text('        Dark Mode',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 17)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        //Invite friends
                        ListTile(
                          leading: Image.asset('assets/Inv_frnds.png'),
                          title: const Text('Invite Friends',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 17)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        //Follow us
                        ListTile(
                          leading: Image.asset('assets/Fllw_us.png'),
                          title: const Text('Follow Us',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 17)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        //Help
                        ListTile(
                          leading: Image.asset('assets/Hlp.png'),
                          title: const Text('Help',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 17)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        //log out
                        ListTile(
                          leading: Image.asset('assets/logout.png'),
                          title: const Text('Log out',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 17)),
                          onTap: () {
                            _auth.signOut();
                            AuthProvider ap = AuthProvider();
                            ap.logout();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loadingscreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                ///drawwe end
                appBar: AppBar(
                  backgroundColor: Color(0xFFA888EB),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  title: Text('Manage your Gem Collection'),

                  //centerTitle: true,
                ),
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 100, // Set the desired height
                        decoration: BoxDecoration(
                          color: Color(0xFFA888EB),
                          borderRadius: BorderRadius.circular(
                              50), // Set the desired color
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Text(
                                'Welcome, ${data!['username']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 170.0,
                            ),
                            Expanded(
                              child: CircleAvatar(
                                backgroundColor: Colors.purple,
                                minRadius: 70.5,
                                child: CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        //AssetImage('images/g.png'),
                                        NetworkImage('${data!['url']}')),
                              ),
                              /*
                              CircleAvatar(
                                radius: 50.0,
                                child: Image(
                                  image: NetworkImage('${data!['url']}'),
                                ),
                              ),*/
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        //Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 15,
                                            offset: const Offset(4, 4),
                                            color: Color(0xFFA888EB),
                                          ),
                                        ],
                                      ),
                                      height: 150.0,
                                      width: 150.0,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          primary: Colors.white,
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          AuthProvider an = AuthProvider();
                                          if (an.isLoggedIn) {
                                            print('true');
                                          } else {
                                            print('false');
                                          }
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddGemPage()),
                                          );

                                          ///add gem
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Image.asset(
                                              'images/d1.png',
                                              height: 130.0,
                                              width: 130.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 15,
                                      offset: const Offset(4, 4),
                                      color: Color(0xFFA888EB),
                                    ),
                                  ],
                                ),
                                height: 150.0,
                                width: 150.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    primary: Colors.white,
                                    elevation: 0,
                                  ),
                                  //messages
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'images/m1.png',
                                        height: 260.0,
                                        width: 130.0,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatScreen()),
                                    );

                                    ///announcement
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 15,
                                      offset: const Offset(4, 4),
                                      color: Color(0xFFA888EB),
                                    ),
                                  ],
                                ),
                                height: 150.0,
                                width: 150.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    primary: Colors.white,
                                    elevation: 0,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'images/d3.png',
                                        height: 200.0,
                                        width: 140.0,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => gemlist()),
                                    );

                                    /////gem view
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 15,
                                      offset: const Offset(4, 4),
                                      color: Color(0xFFA888EB),
                                    ),
                                  ],
                                ),
                                height: 150.0,
                                width: 150.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    primary: Colors.white,
                                    elevation: 0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'images/pro.png',
                                        height: 200.0,
                                        width: 100.0,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    //Navigator.pushNamed(context, ChatScreen.id);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => userdetails()),
                                    );

                                    ///thawa mkk hri tuna ekk dpam
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 15,
                                offset: const Offset(4, 4),
                                color: Color(0xFFA888EB),
                              ),
                            ],
                          ),
                          height: 150.0,
                          width: 450.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              primary: Colors.white,
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => announcement(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/d5.png',
                                  height: 200.0,
                                  width: 260.0,
                                ),
                              ],
                            ),
                          ),
                        ),
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
                          SizedBox(
                            width: 8.0,
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
                    ],
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          }),
    ));
  }
}

////streambuilder
/*

 */
/*
actions: [
                    Container(

                      child: Image(
                        image: NetworkImage('${data!['url']}'),
                      ),
                    ),
                  ],
*/
