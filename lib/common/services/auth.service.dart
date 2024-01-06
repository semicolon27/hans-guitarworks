import 'package:cloud_firestore/cloud_firestore.dart';

class Akun {
  final String id;
  final String userid;
  final String password;
  final String email;
  final String nohp;
  final String alamat;
  final String jk;

  Akun({
    this.id = '',
    this.userid = '',
    this.password = '',
    this.email = '',
    this.nohp = '',
    this.alamat = '',
    this.jk = '',
  });
}

class AkunService {
  final CollectionReference akunCollection = FirebaseFirestore.instance.collection('akun');

  // mendapatkan akun dari database firebase untuk login
  Future<Akun?> getAkun(String userid) async {
    QuerySnapshot snapshot = await akunCollection.where('userid', isEqualTo: userid).get();

    List<Akun> result = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Akun(
        id: doc.id,
        userid: data['userid'],
        password: data['password'],
        email: data['email'],
        nohp: data['nohp'],
        alamat: data['alamat'],
        jk: data['jk'],
      );
    }).toList();

    if (result.length == 0) {
      return null;
    } else {
      return result[0];
    }
  }

  // menambahkan akun ke database firebase untuk register
  Future<void> addAkun({
    required String userid,
    required String password,
    required String email,
    required String nohp,
    required String alamat,
    required String jk,
  }) async {
    await akunCollection.add({
      'userid': userid,
      'password': password,
      'email': email,
      'nohp': nohp,
      'alamat': alamat,
      'jk': jk,
    });
  }

  // mengedit akun ke database firebase
  Future<void> updateAkun({
    required String id,
    required String userid,
    required String password,
    required String email,
    required String nohp,
    required String alamat,
    required String jk,
  }) async {
    await akunCollection.doc(id).update({
      'merek': userid,
      'model': password,
      'warna': email,
      'tahun': nohp,
      'dibuatDi': alamat,
      'material': jk,
    });
  }

  // hapus akun ke database firebase berdasarkan id
  Future<void> deleteAkun(String id) async {
    await akunCollection.doc(id).delete();
  }
}
