import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  _buildHeader() {
    return DrawerHeader(
        decoration: BoxDecoration(color: Colors.teal),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user-image.png'),
              radius: 40,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Manjinder Sarkaria',
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ));
  }

  _buildItem(
      {required IconData icon,
      required String title,
      required GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      minLeadingWidth: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(),
          _buildItem(
              icon: Icons.notifications_rounded,
              title: 'Notifications',
              onTap: () => Navigator.pushNamed(context, 'Notifications')),
          _buildItem(
              icon: Icons.person,
              title: 'Profile',
              onTap: () => Navigator.pushNamed(context, 'Profile')),
          _buildItem(
              icon: Icons.settings,
              title: 'Setting',
              onTap: () => Navigator.pushNamed(context, 'Setting')),
        ],
      ),
    );
  }
}
