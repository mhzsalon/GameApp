import 'package:flutter/material.dart';
import 'package:gameapp/Model/game_model.dart';
import 'package:gameapp/utils/sizeconfig.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.imgList,
  });

  final List<ShortScreenshot> imgList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig(context: context).width,
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return Container(
            width: 240,
            margin: EdgeInsets.only(left: index == 0 ? 0 : 20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              imgList[index].image,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
