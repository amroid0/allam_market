import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository{
  final  CollectionReference cateogryRef=FirebaseFirestore.instance.collection('category');
  final  CollectionReference productRef=FirebaseFirestore.instance.collection('product');
 Future<List<QueryDocumentSnapshot>>getCategories()async{
   var data=await cateogryRef.get();
   return data.docs;
 }
  Future<List<QueryDocumentSnapshot>>getBestSelling()async{
    var data=await productRef.get();
    return data.docs;
  }
}