import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:10,left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            title: Text(
              "John",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            subtitle: Text('Profile'),
          ),


          Divider(height: 50),
          ListTile(
            onTap: (){},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.person,
                color: Colors.blue,
                size: 35,
              ),
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),

          SizedBox(height: 20),

          ListTile(
            onTap: (){},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notification_add_outlined,
                color: Colors.deepPurpleAccent,
                size: 35,
              ),
            ),
            title: Text(
              "Notification",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
          SizedBox(height: 20),

          ListTile(
            onTap: (){},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.privacy_tip_outlined,
                color: Colors.indigo,
                size: 35,
              ),
            ),
            title: Text(
              "Privacy",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
          SizedBox(height: 20),

          ListTile(
            onTap: (){},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.settings,
                color: Colors.green,
                size: 35,
              ),
            ),
            title: Text(
              "General",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
          SizedBox(height: 20),

          ListTile(
            onTap: (){},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.info_outline,
                color: Colors.deepOrangeAccent,
                size: 35,
              ),
            ),
            title: Text(
              "About Us",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
          SizedBox(height: 20),

        ],
      ),
    );
  }
}