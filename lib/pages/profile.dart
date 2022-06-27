

import 'package:flutter/material.dart';
import 'package:myaccount/widget/profile_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const ProfileWidget(),
    );
  }
}