import 'package:allam_market/models/product.dart';
import 'package:allam_market/ui/widget/custom_button.dart';
import 'package:allam_market/ui/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  final ProductModel productModel;
  ProductDetailView(this.productModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         Container(
           height: 170,
           child: Stack(
             children: [
               Container(
                   width: MediaQuery.of(context).size.width,
                   child: Image.network(productModel.picUrl,fit: BoxFit.fill,)),
               Align(alignment :Alignment.centerLeft,child:Icon(Icons.arrow_back) ,)
               ,Align(alignment :Alignment.centerRight,child:Icon(Icons.favorite) ,)
             ],
           ),
         ),
         SizedBox(height: 16,),
         Padding(padding:EdgeInsets.symmetric(horizontal: 16),child: CustomText(text: 'product name',fontSize: 26,)),
         SizedBox(height: 16,),

         Padding(
           padding: EdgeInsets.symmetric(horizontal: 16),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [

               Container(
                 padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade500)
                ),
                 width: MediaQuery.of(context).size.width*.45,
                 child: Row(

                 children: [
                   CustomText(text:'Size'),
                   CustomText(text:productModel.size)
                 ],
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 ),
               ),
               Container(
                 padding: EdgeInsets.all(8),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     border: Border.all(color: Colors.grey.shade500)
                 ),
                 width: MediaQuery.of(context).size.width*.45,
                 child: Row(

                   children: [
                     CustomText(text:'Color'),
                     Container(
                        width: 30,
                       height: 20,
                       decoration: BoxDecoration(
                         color: productModel.color,
                         borderRadius: BorderRadius.circular(8),

                       ),
                     )
                   ],
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 ),
               ),
             ],
           ),
         ),
         SizedBox(height: 16,),
         Expanded(
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Column(
                 children: [
                   CustomText(text: 'detail',fontSize: 18,),
                   SizedBox(height: 16,),
                   CustomText(height: 2.5,text: productModel.desc,)
                 ],
               ),
             ),
           ),
         ),
         Container(
           padding: EdgeInsets.all(16),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 children: [
                   CustomText(text: 'PRICE',color: Colors.grey,),
                   CustomText(text: '${productModel.price}\$',color: Colors.green,),


                 ],
               )
               ,
               Container(
                   width: 120,
                   height: 50,
                   child: CustomButton(onPress:(){},text: 'Add',color: Colors.green,))
             ],
           ),
         )

       ],


     ),
    );
  }
}
