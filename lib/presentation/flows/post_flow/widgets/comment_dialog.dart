import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_test/app+injection/di.dart';
import 'package:social_media_test/data/models/post_model.dart';
import 'package:social_media_test/presentation/custom_widgets/CachImage.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_bloc.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_event.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_state.dart';

class CommentDialog extends StatefulWidget {
  final int postId;
  CommentDialog({required this.postId});
  @override
  _CommentDialogState createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  final TextEditingController _commentController = TextEditingController();

 final bloc=locator<PostBloc>();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("widget.postId${widget.postId}");
    bloc.add(GetComment(postId:widget.postId ));
  }


  void _addComment(String comment) {
    if (comment.isNotEmpty) {
        bloc.add(FillCommentList(comment: Comment(content: comment,image_user: '')));


      _commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: BlocBuilder<PostBloc, PostState>(
        bloc: bloc,
        builder: (context, state) {
          if(state.getCommentStatus==Status.loading)
            return Center(child: CircularProgressIndicator());
          return Container(
            padding: EdgeInsets.all(16.0.w),
            height: 500.h, // Adjust height as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Dialog Title
                Text(
                  'Comments',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),

                // Comment List
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.commentList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.symmetric(vertical: 15.h),
                        child: Row(
                          children: [
                        CachImage(url: state.commentList[index].image_user??'', width: 30.w, hight: 30.w,raduce: 20.r,),
                            ScreenUtil().setHorizontalSpacing(20),
                            Text(state.commentList[index].content??''),

                          ],
                        ),
                      );
                    },
                  ),
                ),

                Divider(),

                // Comment Input Field
               
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Colors.blue),
                      onPressed: () {
                        _addComment(_commentController.text);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}