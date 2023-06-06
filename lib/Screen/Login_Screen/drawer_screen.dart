import 'package:flutter/material.dart';

import 'package:minamifuji/Screen/Login_Screen/loginForm.dart';
import 'package:minamifuji/Screen/Report/ReportScreen.dart';
import 'package:minamifuji/Screen/setting/setting_screen.dart';



class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Sophun'),
            accountEmail: Text('phun@gmail.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                "S",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Profile'),
            onTap: () {
              print("profile");
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: () {
              print("Notification");
            },
          ),
          ListTile(
            leading: Icon(Icons.pie_chart_outline),
            title: Text('Report'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReportScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('settings'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('About US'),
            onTap: () {
              print("About US");
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              SingoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> SingoutDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure??'),
          content: const Text('Do you want to exit?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login_Form()));
              },
            ),
          ],
        );
      },
    );
  }
}
