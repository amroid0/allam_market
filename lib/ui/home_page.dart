import 'package:allam_market/core/viewmodels/home_view_model.dart';
import 'package:allam_market/ui/auth/login_page.dart';
import 'package:allam_market/ui/product_detail_view.dart';
import 'package:allam_market/ui/widget/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  var cateList=['ahelel','bfddf','ccv','dvc','nice','good'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
     init: Get.find(),
      builder:(contoller)=> contoller.loading.value?Center(child: CircularProgressIndicator()):Scaffold(

        body:Padding(
          padding: EdgeInsets.fromLTRB(16, 50, 16, 0),
          child: Column(

            children: [
              _searchViewWidget(),
              SizedBox(height: 30,),
              CustomText(text: 'Cateogry',fontSize: 18,),
              SizedBox(height: 16,),
              _CateogryListView(),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text:'Best Selling',fontSize: 18,),
                  CustomText(text:'see all',fontSize: 16,)

                ],
              ),
              SizedBox(height: 16,),
              _productListView()





            ],


          ),
        )
      ),
    );
  }

  Widget _searchViewWidget(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(50)
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
              prefixIcon: Icon(Icons.search,color: Colors.black,)

        ),
      ),

    );

  }

Widget  _CateogryListView() {
    return GetBuilder<HomeViewModel>(
      builder:(contoller)=> Container(
        height: 100,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder:(context,index){
          return Column(
            children: [
              Container(
                width: 60,
                height: 60,
                child: Padding(padding:EdgeInsets.all(8) ,child: Image.network(contoller.cateogoryList[index].url,fit: BoxFit.contain,)),
                decoration: BoxDecoration(color: Colors.grey.shade100,borderRadius: BorderRadius.circular(50)),
              ),
              SizedBox(height: 16,),
              CustomText(text: contoller.cateogoryList[index].name,fontSize: 12,)
            ],

          );
        },
            separatorBuilder:(context,index)=>SizedBox(width: 20,),
            itemCount:contoller.cateogoryList.length),
      ),
    );


}

Widget _productListView(){
  return GetBuilder<HomeViewModel>(
    builder:(contoller)=> Container(
      height: 350,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder:(context,index){
            return GestureDetector(
              onTap: (){
                Get.to(ProductDetailView(contoller.productList[index]));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*.4,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.grey.shade100,borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        height: 220,
                        child: Image.network(contoller.productList[index].picUrl,fit: BoxFit.fill,),
                      ),
                    ),
                    SizedBox(height: 16,),
                    CustomText(text: contoller.productList[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(height: 8,),
                    CustomText(text: contoller.productList[index].desc,maxLine:1,fontSize: 12,
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,),
                    SizedBox(height: 8,),
                    CustomText(text:'${contoller.productList[index].price}\$',
                      color: Colors.green,
                      alignment: Alignment.bottomLeft,)
                  ],

                ),
              ),
            );
          },
          separatorBuilder:(context,index)=>SizedBox(width: 20,),
          itemCount: contoller.productList.length),
    ),
  );
}



}
