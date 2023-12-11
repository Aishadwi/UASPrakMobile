// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:uasmobile/custom_navbar.dart';
import 'package:uasmobile/detail_doctor.dart';

import 'package:uasmobile/services/firestore_service.dart';
import 'package:uasmobile/tambah_doctor.dart';
import 'package:uasmobile/user.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<SchedulePage> {
  void removeItem(int index) {
    setState(() {
      data_dentist.removeAt(index);
    });
  }

  final CollectionReference _doctors =
      FirebaseFirestore.instance.collection('doctors');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              'Schedule Dentist',
              style: TextStyle(
                color: Color(0xff135699),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Dentist',
              style: TextStyle(color: Color(0xff135699), fontSize: 18),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TambahDoctor(),
                ));
              },
              color: Colors.black,
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirestoreServices().getDoctors(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) =>
                            DetailDoctor(dataDentist: documentSnapshot)),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffE1F5F9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(5, 3),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            //avatar, nama, spesialis, rating, icon
                            Container(
                              margin: EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25.5,
                                    backgroundImage: AssetImage(""),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          documentSnapshot['nama'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff135699),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              // data[index].spesialis!,
                                              documentSnapshot['spesialis'],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff135699),
                                              ),
                                            ),
                                            const Icon(
                                              IconlyBold.star,
                                              color: Colors.amber,
                                              size: 12,
                                            ),
                                            Text(
                                              // data[index].rating!,
                                              documentSnapshot['rating'],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff135699),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            GestureDetector(
                              onTap: () {
                                _doctors.doc(documentSnapshot.id).delete();
                                // Panggil fungsi removeItem saat icon di-klik
                              },
                              child: Icon(
                                IconlyBold.delete,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              Icon(
                                IconlyBold.profile,
                                size: 18,
                                color: Color(0xff3ABEDA),
                              ),
                              Text(
                                // data[index].lokasi!,
                                documentSnapshot['gender'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff135699),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              Icon(
                                IconlyBold.location,
                                size: 18,
                                color: Color(0xff3ABEDA),
                              ),
                              Text(
                                // data[index].lokasi!,
                                documentSnapshot['lokasi'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff135699),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Color(0xff3ABEDA),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      IconlyBold.calendar,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    Text(
                                      // data[index].hari!,
                                      documentSnapshot['hari'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Color(0xff3ABEDA),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      IconlyBold.time_circle,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    Text(
                                      // data[index].waktu!,
                                      documentSnapshot['waktu'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: CustomNavBar.customNavBarr(context, 2),
    );
  }
}
