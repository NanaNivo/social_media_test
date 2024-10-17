import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media_test/app+injection/di.dart';
import 'package:social_media_test/core/navigation/routes.dart';
import 'package:social_media_test/core/resources/colors.dart';
import 'package:social_media_test/presentation/custom_widgets/CachImage.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_bloc.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_event.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_state.dart';

class StoryListWidget extends StatefulWidget {
  @override
  State<StoryListWidget> createState() => _StoryListWidgetState();
}

class _StoryListWidgetState extends State<StoryListWidget> {
  final List<String> userImages = [
    'https://firebasestorage.googleapis.com/v0/b/socialmediatest-3affc.appspot.com/o/profile1.png?alt=media&token=3c04bb91-e301-4e6b-b2a4-5a0dc40f3aef',
    'https://firebasestorage.googleapis.com/v0/b/socialmediatest-3affc.appspot.com/o/profile2.png?alt=media&token=fddd680c-859c-4985-ab24-0ea12619c157',
    'https://firebasestorage.googleapis.com/v0/b/socialmediatest-3affc.appspot.com/o/profile3.png?alt=media&token=e2f3af44-feca-41ed-91cd-f74741d6ba56',
    // Add more URLs here
  ];

  final String storyImage='https://firebasestorage.googleapis.com/v0/b/socialmediatest-3affc.appspot.com/o/I04.png?alt=media&token=a9be1b4b-3332-4866-b1ad-ae4b02f6626b';

  final bloc=locator<PostBloc>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(GetStory());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.w,
      child: BlocBuilder<PostBloc,PostState>(
        bloc: bloc,
        builder: (context,state){

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.storyList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                child: Container(
                  // padding:EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 20.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: locator<AppThemeColors>().white,width: 5.w,strokeAlign:BorderSide.strokeAlignOutside ),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        // Handle tapping on the story avatar

                        context.go(RoutesPath.storyPage,extra: {'userImages':state.storyList,'index':index});
                      },
                      child: CachImage(
                        url:state.storyList[index].image_user??'' ,
                        raduce: 60.r,
                        hight: 50.w,
                        width: 50.w,
                      )

                  ),
                ),
              );
            },
          );
        },

      ),
    );
  }
}