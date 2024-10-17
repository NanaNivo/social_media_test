import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_test/app+injection/di.dart';
import 'package:social_media_test/core/resources/colors.dart';
import 'package:social_media_test/data/models/post_model.dart';
import 'package:social_media_test/data/models/user.dart';
import 'package:social_media_test/presentation/custom_widgets/CachImage.dart';
import 'package:social_media_test/presentation/custom_widgets/text_translation.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:social_media_test/presentation/flows/post_flow/widgets/comment_dialog.dart';

class PostWidget extends StatelessWidget
{
  ScrollController scrollController=ScrollController();
  Post post;
  PostWidget({required this.post});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsetsDirectional.symmetric(vertical: 10.h,horizontal: 6.w),
      color: locator<AppThemeColors>().white,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ) ,
      child: Container(

          padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w,vertical: 12.h),
          decoration: BoxDecoration(
            //  border: Border.all(color: locator<AppThemeColors>().primaryColor),
            borderRadius: BorderRadius.circular(30.r)
          ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachImage(url: post.imageUser??'',raduce: 40.r,width: 35.w,hight: 35.w,),
                    ScreenUtil().setHorizontalSpacing(12),
                    TextTranslation(post.name??'',withTranslation: false,),
                  ],
                ),

                TextTranslation(post.date??'',withTranslation: false,),
      
              ],
            ),
        if(post.content!=null)
        Markdown(
          controller: scrollController,
          selectable: true,
          shrinkWrap: true,
          data: post.content??"",
          onTapLink: (text, href, title) {
            // Handle tap on links, such as @mentions or URLs
            print("Tapped on: $text");
          },

          styleSheet: MarkdownStyleSheet(
            a: TextStyle(color: locator<AppThemeColors>().dark, fontWeight: FontWeight.bold), // Style for links
          ),


          extensionSet: md.ExtensionSet(
            md.ExtensionSet.gitHubFlavored.blockSyntaxes,
            <md.InlineSyntax>[
              md.EmojiSyntax(),
              ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
            ],
          ),
        ),
            if(post.imageContent!=null)
            CachImage(url:post.imageContent??'',hight: 600.h,raduce:30.r ),
            Divider(color: locator<AppThemeColors>().dark,),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(onTap: (){},child: Image.asset("lib/assets/images/png/heart.png")),
                        TextTranslation(post.likesCount!=null?post.likesCount.toString():'0',withTranslation: false,),
                      ],
                    ),
                    ScreenUtil().setHorizontalSpacing(10),
                    Row(
                      children: [
                        InkWell(onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CommentDialog(postId: post.id!,);
                            },
                          );
                        },child: Image.asset("lib/assets/images/png/commet.png")),
                        TextTranslation('3',withTranslation: false,),
                      ],

                    ),
                  ],
                ),

                InkWell(onTap: (){},child: Image.asset("lib/assets/images/png/bookmark.png"))
              ],
            )
          ],
        ),
      ),
    );
  }




}


