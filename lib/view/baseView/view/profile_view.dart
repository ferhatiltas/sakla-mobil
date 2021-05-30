import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sakla/services/api_services.dart';
import 'package:sakla/view/auth/shared/shared_pref.dart';
import 'package:sakla/view/auth/view/splash_view.dart';

import '../../../core/components/profile_app_bar_container.dart';
import '../../../core/extension/context_extension.dart';

class ProfileView extends StatefulWidget {
  var userEmail;
  ProfileView(this.userEmail);
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final apiServices = ApiServices();
  final sharedPrefs = SharedPrefs();
  var userEmail = 'dasdasd';
  var userNameAndSurname = 'dasdsa';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /* apiServices.bringUserInfoWithEmailSakla(widget.userEmail).then((value) {
      userEmail = apiServices.userEmail;
      userNameAndSurname = apiServices.userNameAndSurname;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              buildProfileAppBar(),
              SizedBox(
                height: MediaQuery.of(context).size.height/ 5,
              ),
              CircleAvatar(
                backgroundColor: Color(0xff252880),
                radius: MediaQuery.of(context).size.width / 15,
                child: Text(
                  '${userNameAndSurname[0]}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name - Surname : ${userNameAndSurname.toString()}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Email : ${userEmail.toString()}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              splashColor: Color(0xff252880),
              onTap: () {
                sharedPrefs.deleteSharePrefsData().then((value) {
                  Get.to(()=>SplashView());
                });
              },
              child: Text(
                'Log out',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
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
