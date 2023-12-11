// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uasmobile/custom_navbar.dart';
import 'package:uasmobile/login_page.dart';
import 'package:uasmobile/model/data_dentist.dart';
import 'package:uasmobile/profile_page.dart';
import 'package:uasmobile/schedule_page.dart';
import 'package:uasmobile/services/firebase_auth_service.dart';
import 'package:uasmobile/services/firestore_service.dart';
import 'package:uasmobile/user.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    List<DataDentist> data =
        data_dentist.map((e) => DataDentist.fromJson(e)).toList();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning,',
                    style: TextStyle(
                        color: Color(0xff135699),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  FutureBuilder(
                      future: FirestoreServices.getUserByEmail(
                          _authService.getCurrentUser()!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          DocumentSnapshot user = snapshot.data![0];
                          return Text(
                            user['email'],
                            style: TextStyle(
                                color: Color(0xff135699),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          );
                        } else if (snapshot.hasError) {
                          return Text('error user data  ${snapshot.error}');
                        } else {
                          return const Text("loading");
                        }
                      })
                ],
              ),
            ],
          ),
          leading: Container(
            padding: EdgeInsets.only(left: 12),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: CircleAvatar(
                radius: 25.5,
                backgroundImage: AssetImage('images/Aisha.png'),
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xff3ABEDA),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff135699),
                        offset: Offset(10, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Check your dental\nhealth today',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Schedule your dental check-up\nnow!',
                                  style: TextStyle(
                                      color: Color(0xff135699),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Image.asset('images/dentist.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Our Services',
                  style: TextStyle(
                      color: Color(0xff135699),
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xff3ABEDA),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/tooth.png',
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Scalling',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xff3ABEDA),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/braces.png',
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Braces',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xff3ABEDA),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/prosthetic.png',
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Prosthetic',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xff3ABEDA),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/vineer.png',
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Veneer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xff3ABEDA),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/xray.png',
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'X-Ray',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xff3ABEDA),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Center(
                            child: Text(
                              'Others',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available Doctors',
                      style: TextStyle(
                        color: Color(0xff135699),
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SchedulePage(),
                          ),
                        );
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: Color(0xff135699),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                GridView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff135699)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffEAF2FE),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(data[index].avatar!),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            data[index].nama!,
                            style: TextStyle(
                                color: Color(0xff135699),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                  // Jumlah total item dalam grid
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomNavBar.customNavBarr(context, 0));
  }
}
