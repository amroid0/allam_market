import 'package:allam_market/ui/widget/custom_button.dart';
import 'package:allam_market/ui/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  List products = ['1', '2', '2', '3', '33', '33'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  height: 140,
                  padding: EdgeInsets.symmetric(horizontal: 8,),
                  child: Row(
                    children: [
                      Container(
                        height: 140,
                        child: Image.asset(
                          'assets/images/product.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8,),
                          CustomText(text: 'product name',fontSize: 22,),
                          SizedBox(height: 4,),
                          CustomText(text:'450',color: Colors.green,),
                          SizedBox(height: 16,),
                         Container(
                          width: 80,
                           height: 30,
                           color: Colors.grey.shade200,
                           child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                             Icon(Icons.add,color: Colors.grey,),
                               SizedBox(width: 10,),
                               CustomText(text: '1',fontSize: 22,alignment: Alignment.center,),
                               SizedBox(width: 10,),
                               Padding(
                                 padding: const EdgeInsets.only(bottom:16.0),
                                 child: Icon(Icons.minimize,color: Colors.grey,size: 20,),
                               ),
                           ],
                           ),


                         )
                        ],
                      )

                    ],
                  ),
                );
              },
              itemCount: products.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 8);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'PRICE',
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: '45',
                      color: Colors.green,
                    ),
                  ],
                ),
                Container(
                    width: 120,
                    height: 50,
                    child: CustomButton(
                      onPress: () {},
                      text: 'Checkout',
                      color: Colors.green,
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
