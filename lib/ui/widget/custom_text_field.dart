import 'package:allam_market/ui/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function validator;
  final Function onSaved;
  final String hint;
  final String text;

  CustomTextField({this.validator, this.onSaved, this.hint,this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children:[
          CustomText(text: text,color: Colors.grey.shade900,fontSize: 14,),
        TextFormField(
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(hintText: hint,hintStyle: TextStyle(color: Colors.black),fillColor: Colors.white),),

        ]
      ));
  }
}
