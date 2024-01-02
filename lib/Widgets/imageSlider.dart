import 'package:flutter/material.dart';
import 'package:gameapp/Model/game_model.dart';
import 'package:gameapp/utils/sizeconfig.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key? key,
    required this.imgList,
  }) : super(key: key);

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
          return GestureDetector(
            onTap: () {
              _showFullScreenImage(context, imgList, index);  // Calling method that displays the image in full screen 
            },
            child: Hero(
              tag: 'image_$index', // Unique tag for each image
              child: Container(
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
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to show the full-screen image view
  void _showFullScreenImage(BuildContext context, List<ShortScreenshot> images, int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();  // Close the full-screen view when tapped
            },
            child: Hero(
              tag: 'image_$index', // Use the same tag as in the ImageSlider
              child: PageView.builder(
                itemCount: images.length,
                controller: PageController(initialPage: index),
                itemBuilder: (context, pageIndex) {
                  return Image.network(
                    images[pageIndex].image,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
