import 'package:allam_market/core/services/product_repository.dart';
import 'package:allam_market/models/cateogry.dart';
import 'package:allam_market/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
List<CateogryModel>_cateogories=[];
List<ProductModel>_products=[];
List<CateogryModel> get cateogoryList=>_cateogories;
List<ProductModel> get productList=>_products;
ValueNotifier<bool> get loading => _loading;
ValueNotifier<bool> _loading = ValueNotifier(false);
HomeViewModel(){
  getCatoegories();
  getBestSelling();
}
void getCatoegories()async{
  _loading.value=true;
  ProductRepository().getCategories().then((value){
    for(int i=0;i<value.length;i++){
      _cateogories.add(CateogryModel.fromJson(value[i].data()));
      _loading.value = false;
    }
    update();
  });
}

void getBestSelling()async{
  _loading.value=true;
  ProductRepository().getBestSelling().then((value){
    for(int i=0;i<value.length;i++){
      _products.add(ProductModel.fromJson(value[i].data()));
      _loading.value = false;
    }
    print('${_products.length}hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    update();
  });
}

}