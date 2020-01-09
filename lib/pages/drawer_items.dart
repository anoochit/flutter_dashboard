import 'package:flutter/material.dart';
import '../services/auth.dart';

import 'login.dart';

Widget drawerMenuItems(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: ExactAssetImage("assets/images/avataaars.png"),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text("Streamer")
            ],
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        ListTile(
          leading: Icon(Icons.dashboard),
          title: Text("Dashboard"),
          onTap: () {
            // TODO: Dashboard action
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.local_activity),
          title: Text("Stream"),
          onTap: () {
            // TODO: Stream action
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StreamPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text("SignOut"),
          onTap: () {
            // TODO: Signout button action

            // Set preference
            setLoginState(status: false);

            // navigate to login page
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
          },
        ),
      ],
    ),
  );
}
