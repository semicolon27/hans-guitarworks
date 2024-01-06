import 'package:cloud_firestore/cloud_firestore.dart';

class Gitar {
  final String id;
  final String merek;
  final String model;
  final String warna;
  final String tahun;
  final String dibuatDi;
  final String material;
  final int harga;
  final String gambar;

  Gitar({
    this.id = '',
    this.merek = '',
    this.model = '',
    this.warna = '',
    this.tahun = '',
    this.dibuatDi = '',
    this.material = '',
    this.harga = 0,
    this.gambar = '',
  });
}

class GitarService {
  final CollectionReference gitarCollection = FirebaseFirestore.instance.collection('gitar');

  Future<List<Gitar>> getGitars() async {
    QuerySnapshot snapshot = await gitarCollection.get();
    List<Gitar> result = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Gitar(
        id: doc.id,
        merek: data['merek'],
        model: data['model'],
        warna: data['warna'],
        tahun: data['tahun'],
        dibuatDi: data['dibuatDi'],
        material: data['material'],
        harga: data['harga'],
        gambar: data['gambar'],
      );
    }).toList();
    return result;
  }

  Future<Gitar> getGitarsById(String id) async {
    DocumentSnapshot snapshot = await gitarCollection.doc(id).get();

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    Gitar result = Gitar(
      id: snapshot.id,
      merek: data['merek'],
      model: data['model'],
      warna: data['warna'],
      tahun: data['tahun'],
      dibuatDi: data['dibuatDi'],
      material: data['material'],
      harga: data['harga'],
      gambar: data['gambar'],
    );

    return result;
  }

  Future<void> addGitar({
    required String merek,
    required String model,
    required String warna,
    required String tahun,
    required String dibuatDi,
    required String material,
    required int harga,
    required String gambar,
  }) async {
    await gitarCollection.add({
      'merek': merek,
      'model': model,
      'warna': warna,
      'tahun': tahun,
      'dibuatDi': dibuatDi,
      'material': material,
      'harga': harga,
      'gambar': gambar,
    });
  }

  Future<void> updateGitar({
    required String id,
    required String merek,
    required String model,
    required String warna,
    required String tahun,
    required String dibuatDi,
    required String material,
    required int harga,
    required String gambar,
  }) async {
    await gitarCollection.doc(id).update({
      'merek': merek,
      'model': model,
      'warna': warna,
      'tahun': tahun,
      'dibuatDi': dibuatDi,
      'material': material,
      'harga': harga,
      'gambar': gambar,
    });
  }

  Future<void> deleteGitar(String id) async {
    await gitarCollection.doc(id).delete();
  }
}
