import 'package:allam_market/utils/color_ext.dart';
import 'package:flutter/cupertino.dart';

class ProductModel{
  String name;
  String price;
  String size;
  Color color;
  String desc;
  String picUrl;

  ProductModel(
     { this.name, this.price, this.size, this.color, this.desc, this.picUrl});

  ProductModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null)return;
    name=map['name'];
    price=map['price'];
    size=map['size'];
    color=HexColor.fromHex(map['color']);
    desc=map['desc'];
    picUrl=map['url'];

  }
  toJson(){
    return {
      'name':name,
      'price':price,
      'size':size,
      'color':color,
      'desc':desc,
      'url':picUrl
    };
  }



}