import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_test/app+injection/di.dart';
import 'package:social_media_test/core/resources/colors.dart';
import 'package:social_media_test/core/validators/base_validator.dart';
import 'package:social_media_test/core/validators/required_validator.dart';
import 'package:social_media_test/data/models/user.dart';
import 'package:social_media_test/domain/usecases/post_usecases.dart';
import 'package:social_media_test/presentation/custom_widgets/custom_text_field.dart';
import 'package:social_media_test/presentation/custom_widgets/infinite_list_view/entity/post_wrappers.dart';
import 'package:social_media_test/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';
import 'package:social_media_test/presentation/custom_widgets/infinite_list_view/presentation/pagination_builder.dart';
import 'package:social_media_test/presentation/custom_widgets/text_translation.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_bloc.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_event.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_state.dart';
import 'package:social_media_test/presentation/flows/post_flow/widgets/custom_dialog.dart';
import 'package:social_media_test/presentation/flows/post_flow/widgets/post_widget.dart';
import 'package:social_media_test/presentation/flows/post_flow/widgets/story_list.dart';

class HomeScreen extends StatefulWidget
{

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 // final getTaskPaginationUseCase = locator<GetTask>();
  final taskController = PaginationController<User>();
final  TextEditingController nameController=TextEditingController();
 final  TextEditingController descriptionController=TextEditingController();
 final bloc=locator<PostBloc>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(GetPostEvent());
  }
  @override
  Widget build(BuildContext context) {
     return
       SingleChildScrollView(
         child: Column(
           mainAxisSize: MainAxisSize.min,

           children: [

             ScreenUtil().setVerticalSpacing(20),
             Padding(
               padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [


                   Image.asset('lib/assets/images/png/notification.png'),
                   TextTranslation('SOCIALLY',withTranslation: false,style: TextStyle(color: locator<AppThemeColors>().white,fontWeight: FontWeight.bold,fontSize: 30.sp),),
                   Visibility(visible: false,child: Image.asset('lib/assets/images/png/notification.png')),

                 ],
               ),
             ),
             Card(
               elevation: 2,
               color: locator<AppThemeColors>().primaryColor,
               margin: EdgeInsetsDirectional.symmetric(horizontal: 30.w),

               shape: RoundedRectangleBorder(borderRadius:BorderRadiusDirectional.horizontal(start: Radius.circular(50.sp), // Radius for the start side (left in LTR, right in RTL)
                   end: Radius.circular(50.sp))),
               child: Container(
               padding: EdgeInsetsDirectional.symmetric(vertical: 15.h,horizontal: 5.w),
                 decoration: BoxDecoration(

                   borderRadius: BorderRadiusDirectional.horizontal(start: Radius.circular(50.sp), // Radius for the start side (left in LTR, right in RTL)
                       end: Radius.circular(50.sp))
                 )
               ,child: StoryListWidget()),
             ),
             ScreenUtil().setVerticalSpacing(20),
             Flexible(
               child: BlocBuilder<PostBloc, PostState>(
                 bloc:bloc,
        builder: (context, state) {
          if(state.getPostStatus==Status.loading)
            return SizedBox(height: ScreenUtil().screenHeight,child: Center(child: CircularProgressIndicator(color: locator<AppThemeColors>().white,)));
               return ListView.builder(
                 shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                 padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                 itemCount: state.postList.length,
                   itemBuilder: (context,index){
                     return PostWidget(post: state.postList[index],);
               });
  },
),
             ),
             ScreenUtil().setVerticalSpacing(100),
           ],
         ),
       );

  }
}