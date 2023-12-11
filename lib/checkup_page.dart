// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:uasmobile/custom_navbar.dart';
import 'package:uasmobile/services/firestore_service.dart';
import 'package:uasmobile/tambah_patient.dart';

class PatientPage extends StatelessWidget {
   PatientPage({super.key});

 final CollectionReference _patient =
        FirebaseFirestore.instance.collection('patients');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Patient Data',
            style: TextStyle(
              color: Color(0xff135699),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
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
                    builder: (context) => TambahPatient(),
                  ));
                },
                color: Colors.black,
              ),
            )
          ],
        ),
        body: StreamBuilder(
          stream: FirestoreServices().getPatient(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                  return Container(
                    margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffE1F5F9),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              //avatar, nama, spesialis, rating, icon
                              Container(
                                margin: EdgeInsets.only(bottom: 12),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25.5,
                                      backgroundImage:
                                          AssetImage(""),
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
                                            documentSnapshot['nama'] ?? 'kosong',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff135699),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Patient",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff135699),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              const Icon(
                                                IconlyBold.more_circle,
                                                color: Colors.amber,
                                                size: 10,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                documentSnapshot['id'] ?? 'kosong',
                                                style: const TextStyle(
                                                  fontSize: 14,
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
                                  _patient.doc(documentSnapshot.id).delete();
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
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
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                documentSnapshot['alamat'] ?? "kosong",
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
                                IconlyBold.call,
                                size: 18,
                                color: Color(0xff3ABEDA),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                documentSnapshot['nohp'] ?? 'kosong',
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
                                IconlyBold.profile,
                                size: 18,
                                color: Color(0xff3ABEDA),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                documentSnapshot['gender'] ?? 'kosong',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff135699),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
           
                },
              
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        bottomNavigationBar: CustomNavBar.customNavBarr(context, 1));
  }
}
