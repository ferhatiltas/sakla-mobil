import 'package:flutter/material.dart';
import 'package:sakla/core/components/profile_app_bar_container.dart';
import 'package:sakla/core/extension/context_extension.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          buildProfileAppBar(),
          SizedBox(
            height: context.height / 5,
          ),
          Container()
        ],
      ),
    );
  }

  ProfileAppBar buildProfileAppBar() {
    return ProfileAppBar(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person,
          color: Colors.white,
          size: 50,
        ),
        Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 25),
        )
      ],
    ));
  }
}
