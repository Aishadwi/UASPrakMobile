import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:uasmobile/custom_navbar.dart';
import 'package:uasmobile/services/firebase_auth_service.dart';
import 'package:uasmobile/services/firestore_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
 final FirebaseAuthService _authService = FirebaseAuthService();
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
              color: Color(0xff135699),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/Aisha.png'),
            ),
            SizedBox(
              height: 24,
            ),
            FutureBuilder(
                future: FirestoreServices.getUserByEmail(_authService.getCurrentUser()!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                     DocumentSnapshot user = snapshot.data![0];
                      return SizedBox(
                        width: double.infinity,
                        child: 
                               Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: Material(
                                  child: Column(
                                    children: [
                                      Text(
                                        user['email'],
                                        style: TextStyle(
                                            color: Color(0xff135699),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Admin',
                                        style: TextStyle(
                                          color: Color(0xff135699),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                         
                    }
                  }
                },)
          ],
        ),
      ),
bottomNavigationBar: CustomNavBar.customNavBarr(context, 3),
      
    );
  }
}
