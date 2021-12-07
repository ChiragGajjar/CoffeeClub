import 'dart:convert';

import 'package:coffee_club/models/product_details_data_model.dart';
import 'package:coffee_club/screens/ProductDetails/product_items_card.dart';
import 'package:coffee_club/utils/helpers/common_imports.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductDetailsState();
  }
}

class ProductDetailsState extends BaseStatefulWidgetState<ProductDetails> {

  var intCartCount = 1;

  var objProductDetails = ProductDetailsDataModel();

  var intTotalPrice = 0;
  var intTempTotalPrice = 0;
  var isSelectedValue = '';
  var isSelectedPrice = '0';

  @override
  void initState() {
    super.initState();
    getProductDetails();
  }




  @override
  void dispose() {
    super.dispose();
  }

  //Load JSON data into model class
  Future<void> getProductDetails() async {
    String productData = await DefaultAssetBundle.of(context).loadString("assets/product.json");
    final jsonResult = jsonDecode(productData);
    setState(() {
      objProductDetails = ProductDetailsDataModel.fromJson(jsonResult);
      intTotalPrice = objProductDetails.getPrice()!;
      intTempTotalPrice = objProductDetails.getPrice()!;

    });
  }

  @override
  Widget getBodyWidget(Size size) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: size.width,
            height: 250.h,
            // color: AppColors.appThemeColor,
            child: Image.network(
              objProductDetails.images!.getFullSizeImage(),
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SizedBox(
              height: 50.h,
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    height:35.h,
                    width: 35.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.5),
                        color: AppColors.white,
                    ),
                    child: IconButton(
                      onPressed: () {
                        pop(context);
                      },
                      icon: Image(
                        image: AppImages.back,
                        color: AppColors.mediumGrey,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 200,
            ),
            // color: Colors.red,
            child: SizedBox(
              width: (size.width),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                   Text(
                    objProductDetails.getName(),
                    style: const TextStyle(
                      fontFamily: FontsFamily.gilroyRegular,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      color: AppColors.dark2Grey,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    objProductDetails.getDescription(),
                    style: const TextStyle(
                      fontFamily: FontsFamily.gilroyRegular,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                      color: AppColors.mediumGrey,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 1,
                    color: AppColors.greyBorderColor,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 60.h,
                    child: Row(
                      children: [
                        Text(
                          '฿${intTotalPrice.toString()}',
                          style: const TextStyle(
                            fontFamily: FontsFamily.gilroyRegular,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: AppColors.dark2Grey,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            InkWell(
                              child: SizedBox(
                                height: 30.h,
                                width: 30.w,
                                child: Image(
                                  image: AppImages.remove,
                                  color: intCartCount == 1 ? AppColors.grey : AppColors.coffee,
                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  if (intCartCount > 1 ){
                                    intCartCount = intCartCount - 1;
                                    intTotalPrice = ((intCartCount * objProductDetails.getPrice()!) + int.parse(isSelectedPrice));
                                  }
                                  intTempTotalPrice = (intCartCount * objProductDetails.getPrice()!);
                                });
                              },
                            ),
                            SizedBox(
                              width: 50.h,
                              child: Text(
                                intCartCount.toString(),
                                style: const TextStyle(
                                  fontFamily: FontsFamily.gilroyRegular,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  color: AppColors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            InkWell(
                              child: SizedBox(
                                height: 30.h,
                                width: 30.w,
                                child: Image(
                                  image: AppImages.add,
                                  color: intCartCount >= 10 ? AppColors.grey : AppColors.coffee,
                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  if (intCartCount >= 1 && intCartCount < 10){
                                    intCartCount = intCartCount + 1;
                                    intTotalPrice = ((intCartCount * objProductDetails.getPrice()!) + int.parse(isSelectedPrice));
                                  }
                                  intTempTotalPrice = (intCartCount * objProductDetails.getPrice()!);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.lightGrey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      height: 50.h,
                      child: objProductDetails.getItemList()!.isNotEmpty ? Row(
                        children: [
                          Text(
                            objProductDetails.getItemList()!.first.getName().toUpperCase(),
                            style: const TextStyle(
                              fontFamily: FontsFamily.gilroyRegular,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                              color: AppColors.dark2Grey,
                            ),
                          ),
                          const Text(
                            ' (REQUIRED)',
                            style: TextStyle(
                              fontFamily: FontsFamily.gilroyRegular,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                              color: AppColors.mediumGrey,
                            ),
                          ),
                        ],
                      ) : Container(),
                    ),
                  ),
                  Container(
                    color: AppColors.greyItem,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      height: 40.h,
                      child: Row(
                        children: const [
                          Text(
                            AppString.pleaseSelectItem,
                            style: TextStyle(
                              fontFamily: FontsFamily.gilroyRegular,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: AppColors.dark2Grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 0),
                      child: objProductDetails.getExtraItemList()!.isNotEmpty ? ListView.builder(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        itemCount: objProductDetails.getExtraItemList()!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Container(
                              child: productDetailCardView(
                                objDetails: objProductDetails.getExtraItemList()![index],
                                isSelectedValue: isSelectedValue,
                              ),
                            ),
                            onTap:() {
                              setState(() {
                                  isSelectedValue = objProductDetails.getExtraItemList()![index].getName();
                                  isSelectedPrice = objProductDetails.getExtraItemList()![index].getPrice();

                                  intTotalPrice = intTempTotalPrice + int.parse(isSelectedPrice);

                                  if (intTempTotalPrice != (intTotalPrice - int.parse(isSelectedPrice)) && isSelectedPrice == '0'){
                                    intTotalPrice -= int.parse(isSelectedPrice);
                                    isSelectedPrice = '';
                                  }

                              });
                            },
                          );
                        },
                      ) : Container(),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: AppColors.darkCoffee,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Image(
                            image: AppImages.shoppingCart,
                            color: AppColors.white,
                            height: 40.h,
                            width: 40.w,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Text(
                          AppString.add.toUpperCase() + ' ${intCartCount.toString()} ' + AppString.toCart.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: FontsFamily.gilroyRegular,
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                            color: AppColors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10.w),
                          child: Text(
                            '฿${intTotalPrice.toString()}',
                            style: const TextStyle(
                              fontFamily: FontsFamily.gilroyRegular,
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {}
}
