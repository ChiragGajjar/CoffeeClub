import 'dart:ui';

import 'package:coffee_club/utils/custom_font/custom_font.dart';
import 'package:coffee_club/utils/helpers/common_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCommonDialogWithSingleButton extends StatefulWidget {
  final String? title, descriptions, buttonTextPositive;
  final Function? onClickPositive;

  const AppCommonDialogWithSingleButton(
      { this.title,
        this.descriptions,
        this.buttonTextPositive,
        this.onClickPositive,});

  @override
  AppCommonDialogWithTwoButtonState createState() => AppCommonDialogWithTwoButtonState();
}

class AppCommonDialogWithTwoButtonState extends State<AppCommonDialogWithSingleButton> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: AppColors.transperent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 10),
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.title ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                    fontFamily: FontsFamily.gilroyRegular,
                    fontWeight: FontWeights.semiBold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                margin: const EdgeInsets.all(5),
                child: Text(
                  widget.descriptions ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: FontsFamily.gilroyRegular,
                    fontWeight: FontWeights.regular,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 35,
                child: Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    color: AppColors.appThemeColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        widget.onClickPositive!();
                      });
                    },
                    child: Center(
                      child: Text(
                        widget.buttonTextPositive ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontFamily: FontsFamily.gilroyRegular,
                          fontWeight: FontWeights.regular,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
