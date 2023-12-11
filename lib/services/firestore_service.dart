import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference users =
    FirebaseFirestore.instance.collection('users');
final CollectionReference _doctors =
    FirebaseFirestore.instance.collection('doctors');
final CollectionReference _patient =
    FirebaseFirestore.instance.collection('patients');

class FirestoreServices {
  final String? uid;
  FirestoreServices({this.uid});
  Future<void> CreateUser(String email) async {
    return await users.doc(uid).set({'email': email});
  }

  Stream<QuerySnapshot> getUsers() {
    final usersStream = users.snapshots();
    return usersStream;
  }

  Stream<QuerySnapshot> getDoctors() {
    return _doctors.snapshots();
  }

  Stream<QuerySnapshot> getPatient() {
    return _patient.snapshots();
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getUserByEmail(
      String email) {
    return users
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs);
  }
}
