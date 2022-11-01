import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/profile_list_item.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_application_1/components/constants.dart';
import 'package:flutter_application_1/components/profile_list_item.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:  
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0
        ),
        child: ListView(
          children: <Widget>[
            ProfileListItem(
              icon: LineAwesomeIcons.user_shield,
              text: 'Privacy', 
            ),
            ProfileListItem(
              icon: LineAwesomeIcons.history,
              text: 'Purchase History',
            ),
            ProfileListItem(
              icon: LineAwesomeIcons.question_circle,
              text: 'Help & Support',
            ),
            ProfileListItem(
              icon: LineAwesomeIcons.cog,
              text: 'Settings',
            ),
            ProfileListItem(
              icon: LineAwesomeIcons.user_plus,
              text: 'Invite a Friend',
            ),
            ProfileListItem(
              icon: LineAwesomeIcons.alternate_sign_out,
              text: 'Logout',
              hasNavigation: false,
            ),
          ],
        ),
      ),
    );

  }
}