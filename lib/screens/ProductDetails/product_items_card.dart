

import 'package:coffee_club/models/product_details_data_model.dart';
import 'package:coffee_club/utils/helpers/common_imports.dart';
import 'package:flutter/material.dart';

class productDetailCardView extends StatefulWidget {

  late final ProductDetailsExtraItemsDataModel objDetails;
  var isSelectedValue = '';
  productDetailCardView({required this.objDetails,required this.isSelectedValue});

  @override
  productDetailCardViewState createState() => productDetailCardViewState();
}

class productDetailCardViewState extends State<productDetailCardView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h,bottom: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        widget.objDetails.getName(),
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontFamily: FontsFamily.gilroyRegular,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        (widget.objDetails.getPrice() == '0' ? '' : ' (฿' + widget.objDetails.getPrice().toString() + ')'),
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontFamily: FontsFamily.gilroyRegular,
                          fontWeight: FontWeight.w400,
                          color: AppColors.mediumGrey,
                        ),
                      ),
                      const Spacer(),
                      Image(
                        image: widget.objDetails.getName() == widget.isSelectedValue ? AppImages.selected : AppImages.unSelected,
                        width: 16.w,
                        height: 16.h,
                        color: AppColors.darkGrey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: AppColors.greyBorderColor,
        ),
      ],
    );
  }
}