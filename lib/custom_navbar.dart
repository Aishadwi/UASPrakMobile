import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:uasmobile/checkup_page.dart';

import 'package:uasmobile/home_page.dart';
import 'package:uasmobile/profile_page.dart';
import 'package:uasmobile/schedule_page.dart';


class CustomNavBar {
  static Widget customNavBarr(BuildContext context, int i) {

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.add_user),
          label: 'Check-Up',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.calendar),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'Profile',
        ),
      ],
      currentIndex: i,
      onTap: (int index) {
        if (index == 0 && i != 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  HomePage()));
       
        } else if (index == 1 && i != 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PatientPage()));
         
        } else if (index == 2 && i != 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  SchedulePage()));
        
        } else if (index == 3 && i != 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfilePage()));
        
        }
      },
      selectedItemColor: const Color(0xff135699),
      unselectedItemColor: Colors.blueGrey,
      showUnselectedLabels: true,
    );
  }
}
