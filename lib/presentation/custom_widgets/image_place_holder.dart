import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePlaceHolder extends StatelessWidget {
  String? placehlder;
  double? width;
  BoxFit? fit;
  Color? color;
  double? raduis;
   ImagePlaceHolder({super.key,this.placehlder,this.fit,this.color,this.width,this.raduis});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
       //  shape: BoxShape.circle,
           borderRadius: BorderRadiusDirectional.circular(raduis??12.r),
         image: DecorationImage(
           image: AssetImage( placehlder??'lib/assets/images/png/Placeholder.png'),
             fit: fit??BoxFit.cover,
             // color: color,
             // width: width
         )
       ),

    );
  }
}
