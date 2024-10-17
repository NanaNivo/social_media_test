import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media_test/app+injection/di.dart';
import 'package:social_media_test/core/navigation/routes.dart';
import 'package:social_media_test/core/resources/colors.dart';
import 'package:social_media_test/data/models/post_model.dart';
import 'package:social_media_test/presentation/custom_widgets/text_translation.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_bloc.dart';
import 'package:social_media_test/presentation/flows/post_flow/widgets/story_view_widget.dart';
import 'package:story_view/story_view.dart' as story;


class StoryViewer extends StatefulWidget {
  final List<Story> userImages;
  final int index;


  StoryViewer({required this.userImages,required this.index});

  @override
  _StoryViewerState createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  final story.StoryController _storyController = story.StoryController();


  @override
  void dispose() {
    _storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = widget.userImages.map((imageUrl) {
      return StoryItem.pageImage(
        url: imageUrl.image_content??'',
        controller: _storyController,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
          toolbarHeight:40.h,
        backgroundColor: locator<AppThemeColors>().dark,

      ),
      body: StoryViewWidget(
        storyItems: storyItems,
        controller: _storyController,
        progressPosition: ProgressPosition.top,
        indicatorForegroundColor: locator<AppThemeColors>().white,
       indicatorColor: locator<AppThemeColors>().gray,
        inline: false,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('lib/assets/images/svg/back.svg',width: 50.w,height: 50.h,),
                    ScreenUtil().setHorizontalSpacing(12),
                    TextTranslation(widget.userImages[widget.index].name??'',withTranslation: false,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: locator<AppThemeColors>().gray.withOpacity(0.6),),),
                    ScreenUtil().setHorizontalSpacing(12),
                    TextTranslation(widget.userImages[widget.index].date??'',withTranslation: false,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: locator<AppThemeColors>().gray.withOpacity(0.6))),
                  ],
                ),

                Image.asset('lib/assets/images/png/download.png')
              ],
            ),
          ),
        onComplete: () {
          context.go(RoutesPath.rootPage); // Exit when stories finish
        },
        onVerticalSwipeComplete: (direction) {
          if (direction == story.Direction.down) {
            context.pop(); // Exit on swipe down
          }
        },
      ),
    );
  }
}