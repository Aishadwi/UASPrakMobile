import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:uasmobile/schedule_page.dart';

class TambahDoctor extends StatelessWidget {
  TambahDoctor({super.key});
  final CollectionReference _doctors =
      FirebaseFirestore.instance.collection('doctors');

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _spesialisController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  final TextEditingController _hariController = TextEditingController();
  final TextEditingController _waktuController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tambah Doctor',
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
                controller: _namaController,
                decoration: InputDecoration(
                  hintText: 'nama',
                  hintStyle: const TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 14,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _spesialisController,
                decoration: InputDecoration(
                  hintText: 'spesialis',
                  hintStyle: const TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 14,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _ratingController,
                decoration: InputDecoration(
                  hintText: 'rating',
                  hintStyle: const TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 14,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _lokasiController,
                decoration: InputDecoration(
                  hintText: 'lokasi',
                  hintStyle: const TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 14,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xff3ABEDA).withOpacity(0.15),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                  border: Border.all(
                    color: const Color(0xff3ABEDA),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Schedule',
                      style: TextStyle(
                        color: Color(0xff3ABEDA),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      controller: _hariController,
                      decoration: InputDecoration(
                        hintText: 'hari',
                        hintStyle: const TextStyle(
                          color: Color(0xffACACAC),
                          fontSize: 14,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff3ABEDA)),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff3ABEDA)),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      controller: _waktuController,
                      decoration: InputDecoration(
                        hintText: 'waktu',
                        hintStyle: const TextStyle(
                          color: Color(0xffACACAC),
                          fontSize: 14,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff3ABEDA)),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff3ABEDA)),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _genderController,
                decoration: InputDecoration(
                  hintText: 'gender',
                  hintStyle: const TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 14,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3ABEDA)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: const OutlineInputBorder(
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
                    final String nama = _namaController.text;
                    final String spesialis = _spesialisController.text;
                    final String rating = _ratingController.text;
                    final String lokasi = _lokasiController.text;
                    final String hari = _hariController.text;
                    final String waktu = _waktuController.text;
                    final String gender = _genderController.text;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => SchedulePage()),
                      ),
                    );
                    await _doctors.add({
                      'nama': nama,
                      'spesialis': spesialis,
                      'rating': rating,
                      'lokasi': lokasi,
                      'hari': hari,
                      'waktu': waktu,
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
