import 'dart:ffi';

import 'package:allam_market/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepo{
  final CollectionReference _userRef=
  FirebaseFirestore.instance.collection('Users');
  Future<void> saveUser(UserModel model)async{
   return await _userRef.doc(model.userId).set(model.toJson());

  }
}