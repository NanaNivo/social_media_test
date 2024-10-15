import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_test/app+injection/di.dart';
import 'package:social_media_test/core/resources/colors.dart';
import 'package:social_media_test/data/models/user.dart';
import 'package:social_media_test/presentation/custom_widgets/text_translation.dart';

class TaskWidget extends StatelessWidget
{
  User user;
  TaskWidget({required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: 10.h),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w,vertical: 5.h),
        decoration: BoxDecoration(
            border: Border.all(color: locator<AppThemeColors>().primaryColor),
          borderRadius: BorderRadius.circular(5.r)
        ),
      child: Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextTranslation('name:',withTranslation: false,),
              ScreenUtil().setHorizontalSpacing(10.w),
              TextTranslation(user.firstName??'',withTranslation: false,),
            ],
          ),
          Row(
            children: [
              TextTranslation('description:',withTranslation: false,),
              ScreenUtil().setHorizontalSpacing(10.w),
              TextTranslation(user.job??'',withTranslation: false,),
            ],
          )
        ],
      ),
    );
  }

}