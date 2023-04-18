import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                "Hash Herath",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,
                ),
              ),
              accountEmail: Text(
                "hashiniherath5@icloud.com",
                style: TextStyle(color: Colors.indigo, fontSize: 17),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/usr.jpg'),
              ),
            ),

            //Home
            ListTile(
              leading: Image.asset('assets/Home.png'),
              title: const Text('Home',
                  style: TextStyle(color: Colors.indigo, fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //Inventory
            ListTile(
              leading: Image.asset('assets/Inventory.png'),
              title: const Text('Inventory',
                  style: TextStyle(color: Colors.indigo, fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //Announcement
            ListTile(
              leading: Image.asset('assets/Announcement.png'),
              title: const Text('Announcement',
                  style: TextStyle(color: Colors.indigo, fontSize: 17)),
              onTap: () {},
            ),
            //messages
            ListTile(
              leading: Image.asset('assets/Msgs.png'),
              title: const Text('Messeges',
                  style: TextStyle(color: Colors.indigo, fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //Profile
            ListTile(
              leading: Image.asset('assets/Profile.png'),
              title: const Text('Profile',
                  style: TextStyle(color: Colors.indigo, fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //Dark mode
            ListTile(
              trailing: Image.asset('assets/Switch.png'),
              title: const Text('        Dark Mode',
                  style: TextStyle(color: Colors.indigo, fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //Invite friends
            ListTile(
              leading: Image.asset('assets/Inv_frnds.png'),
              title: const Text('Invite Friends',
                  style: TextStyle(color: Colors.indigo, fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //Follow us
            ListTile(
              leading: Image.asset('assets/Fllw_us.png'),
              title: const Text('Follow Us',
                  style: TextStyle(color: Colors.indigo, fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //Help
            ListTile(
              leading: Image.asset('assets/Hlp.png'),
              title: const Text('Help',
                  style: TextStyle(color: Colors.indigo, fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //log out
            ListTile(
              leading: Image.asset('assets/logout.png'),
              title: const Text('Log out',
                  style: TextStyle(color: Colors.indigo, fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
