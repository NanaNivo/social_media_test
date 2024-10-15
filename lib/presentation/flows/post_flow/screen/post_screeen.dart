import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:social_media_test/presentation/flows/post_flow/widgets/custom_dialog.dart';
import 'package:social_media_test/presentation/flows/post_flow/widgets/post_widget.dart';

class TaskScreen extends StatefulWidget
{

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

 // final getTaskPaginationUseCase = locator<GetTask>();
  final taskController = PaginationController<User>();
final  TextEditingController nameController=TextEditingController();
 final  TextEditingController descriptionController=TextEditingController();
 //final bloc=locator<TaskBloc>();
  @override
  Widget build(BuildContext context) {
     return SafeArea(
       child: Scaffold(
         body: Column(
           children: [
             // Container(
             //   height: ScreenUtil().screenHeight/1.4,
             //   child: getTaskPaginationUseCase
             //       .buildPaginationList<User>(
             //       extraParams: {},
             //       controller: taskController,
             //       gridBuilder: (data, index) {
             //         return SizedBox();
             //       },
             //       listBuilder: (data, index) {
             //         return Padding(
             //           padding: EdgeInsetsDirectional.symmetric(
             //               horizontal: 5.w),
             //           child: TaskWidget(
             //             user: data,
             //           ),
             //         );
             //       }),
             // ),
             // Row(
             //   children: [
             //     TextButton(onPressed: (){
             //       showDialog(
             //         context: context,
             //         builder: (BuildContext context) {
             //           return CustomDialog(
             //             child:
             //             Column(
             //               mainAxisSize: MainAxisSize.min,
             //               children: <Widget>[
             //                 Text(
             //                   'Custom Dialog',
             //                   style: TextStyle(
             //                     fontSize: 22.0,
             //                     fontWeight: FontWeight.bold,
             //                   ),
             //                 ),
             //                 ScreenUtil().setVerticalSpacing(5.h),
             //                 CustomTextField(
             //                   hintText: "name",
             //                   controller: nameController,
             //                   colorBorder: locator<AppThemeColors>().dark,
             //                   raduceBorder: 12.r,
             //                   widthBorder: 1.5,
             //                   onvalidator: (value) {
             //                     return BaseValidator.validateValue(
             //                         value, [ RequiredValidator()], true);
             //                   },
             //                 ),
             //                 ScreenUtil().setVerticalSpacing(5.h),
             //                 CustomTextField(
             //                   hintText: "description",
             //                   controller: descriptionController,
             //                   colorBorder: locator<AppThemeColors>().dark,
             //                   raduceBorder: 12.r,
             //                   widthBorder: 1.5,
             //                   onvalidator: (value) {
             //                     return BaseValidator.validateValue(
             //                         value, [ RequiredValidator()], true);
             //                   },
             //                 ),
             //                 Align(
             //                   alignment: Alignment.bottomRight,
             //                   child: ElevatedButton(
             //                     onPressed: () {
             //                       bloc.add(AddTaskEvent(user: User(firstName: nameController.text,job: descriptionController.text)));
             //                       Navigator.of(context).pop();
             //                     },
             //                     child: Text('Close'),
             //                   ),
             //                 ),
             //               ],
             //             ),
             //           );
             //         },
             //       );
             //     }, child: TextTranslation("Add Task",withTranslation: false,)),
             //     TextButton(onPressed: (){
             //       showDialog(
             //         context: context,
             //         builder: (BuildContext context) {
             //           return CustomDialog(
             //             child:
             //             Column(
             //               mainAxisSize: MainAxisSize.min,
             //               children: <Widget>[
             //                 Text(
             //                   'Custom Dialog',
             //                   style: TextStyle(
             //                     fontSize: 22.0,
             //                     fontWeight: FontWeight.bold,
             //                   ),
             //                 ),
             //                 ScreenUtil().setVerticalSpacing(5.h),
             //                 CustomTextField(
             //                   hintText: "name",
             //                   controller: nameController,
             //                   colorBorder: locator<AppThemeColors>().dark,
             //                   raduceBorder: 12.r,
             //                   widthBorder: 1.5,
             //                   onvalidator: (value) {
             //                     return BaseValidator.validateValue(
             //                         value, [ RequiredValidator()], true);
             //                   },
             //                 ),
             //                 ScreenUtil().setVerticalSpacing(5.h),
             //                 CustomTextField(
             //                   hintText: "description",
             //                   controller: descriptionController,
             //                   colorBorder: locator<AppThemeColors>().dark,
             //                   raduceBorder: 12.r,
             //                   widthBorder: 1.5,
             //                   onvalidator: (value) {
             //                     return BaseValidator.validateValue(
             //                         value, [ RequiredValidator()], true);
             //                   },
             //                 ),
             //                 Align(
             //                   alignment: Alignment.bottomRight,
             //                   child: ElevatedButton(
             //                     onPressed: () {
             //                       bloc.add(UpdateTaskEvent(user: User(firstName: nameController.text,job: descriptionController.text)));
             //                       Navigator.of(context).pop();
             //                     },
             //                     child: Text('Close'),
             //                   ),
             //                 ),
             //               ],
             //             ),
             //           );
             //         },
             //       );
             //     }, child: TextTranslation("update Task",withTranslation: false,)),
             //     TextButton(onPressed: (){
             //       showDialog(
             //         context: context,
             //         builder: (BuildContext context) {
             //           return CustomDialog(
             //             child:
             //             Column(
             //               mainAxisSize: MainAxisSize.min,
             //               children: <Widget>[
             //                 Text(
             //                   'Custom Dialog',
             //                   style: TextStyle(
             //                     fontSize: 22.0,
             //                     fontWeight: FontWeight.bold,
             //                   ),
             //                 ),
             //                 ScreenUtil().setVerticalSpacing(5.h),
             //                 CustomTextField(
             //                   hintText: "id",
             //                   controller: nameController,
             //                   colorBorder: locator<AppThemeColors>().dark,
             //                   raduceBorder: 12.r,
             //                   widthBorder: 1.5,
             //                   onvalidator: (value) {
             //                     return BaseValidator.validateValue(
             //                         value, [ RequiredValidator()], true);
             //                   },
             //                 ),
             //
             //                 Align(
             //                   alignment: Alignment.bottomRight,
             //                   child: ElevatedButton(
             //                     onPressed: () {
             //                       bloc.add(DeletTaskEvent(id:int.parse(nameController.text)));
             //                       Navigator.of(context).pop();
             //                     },
             //                     child: Text('Close'),
             //                   ),
             //                 ),
             //               ],
             //             ),
             //           );
             //         },
             //       );;
             //     }, child: TextTranslation("Deleite Task",withTranslation: false,))
             //   ],
             // )
           ],
         ),
       ),
     );
  }
}