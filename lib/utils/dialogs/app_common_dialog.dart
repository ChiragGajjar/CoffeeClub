import 'dart:ui';
import 'package:coffee_club/utils/helpers/common_imports.dart';
import 'package:flutter/material.dart';

class AppCommonDialog extends StatefulWidget {
  final String title, descriptions, buttonText;
  final Function? onClickPositive;

  const AppCommonDialog(
      {required this.title,
      required this.descriptions,
      required this.buttonText,
      required this.onClickPositive});

  @override
  AppCommonDialogState createState() => AppCommonDialogState();
}

class AppCommonDialogState extends State<AppCommonDialog> {
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
          padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: const TextStyle(
              fontSize: 14,
              color: AppColors.black,
              fontFamily: FontsFamily.gilroyRegular,
              fontWeight: FontWeights.semiBold,
              fontStyle: FontStyle.normal,
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    widget.descriptions,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: FontsFamily.gilroyRegular,
                      fontWeight: FontWeights.regular,
                    ),
                    textAlign: TextAlign.center,
                  )),
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 35,
                child: Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    color: AppColors.appThemeColor,
                    onPressed: () {
                      setState(() {
                        widget.onClickPositive!();
                        Navigator.of(context).pop();
                      });
                    },
                    child: Center(
                      child: Text(
                        widget.buttonText,
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
