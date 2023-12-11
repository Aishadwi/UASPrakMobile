import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uasmobile/checkup_page.dart';


class TambahPatient extends StatelessWidget {
  TambahPatient({super.key});
  final CollectionReference _patient=
      FirebaseFirestore.instance.collection('patients');

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tambah Patient',
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
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(""),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _idController,
                decoration: const InputDecoration(
                  hintText: 'id',
                  hintStyle: TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  hintText: 'Nama',
                  hintStyle: TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _alamatController,
                decoration: const InputDecoration(
                  hintText: 'Alamat',
                  hintStyle: TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _noHpController,
                decoration: const InputDecoration(
                  hintText: 'NOHP',
                  hintStyle: TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
             
              TextField(
                controller: _genderController,
                decoration: const InputDecoration(
                  hintText: 'gender',
                  hintStyle: TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final String id = _idController.text;
                    final String nama = _namaController.text;
                    final String alamat = _alamatController.text;
                    final String noHp = _noHpController.text;
                    final String gender = _genderController.text;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => PatientPage()),
                      ),
                    );
                    await _patient.add({
                      'id': id,
                      'nama': nama,
                      'alamat': alamat,
                      'nohp': noHp,
                      'gender': gender
                    });
                  },
                  child: Container(
                  
                    padding: const EdgeInsets.fromLTRB(48, 12, 48, 12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Color(0xff3ABEDA),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
