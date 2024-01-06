import 'package:flutter/foundation.dart';

class AkunProvider with ChangeNotifier {
  String id = '';
  String userid = '';
  String email = '';
  String nohp = '';
  String alamat = '';
  String jk = '';

  fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? '';
    userid = map['userid'] ?? '';
    email = map['email'] ?? '';
    nohp = map['nohp'] ?? '';
    alamat = map['alamat'] ?? '';
    jk = map['jk'] ?? '';

    notifyListeners();
  }
}
