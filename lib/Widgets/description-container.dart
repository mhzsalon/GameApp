import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gameapp/Screens/game-description%20components/appIcon-name.dart';
import 'package:gameapp/utils/app-colors.dart';
import 'package:gameapp/utils/sizeconfig.dart';
import 'package:gameapp/utils/textstyle.dart';

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      "assets/bg2.jpg",
      "assets/bg1.jpg",
      "assets/bgImg.jpg"
    ];
    return Container(
      width: SizeConfig(context: context).width,
      height: SizeConfig(context: context).height * 0.7,
      decoration: BoxDecoration(
        color: AppColors.modalColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.elliptical(40, 25),
          topRight: Radius.elliptical(40, 25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topComponet(context),
            const SizedBox(
              height: 35,
            ),
            ImageSlider(imgList: imgList),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 15, right: 5),
              title: Text(
                "About this game",
                style: appTextstyle(16, Colors.white, FontWeight.w600),
              ),
              trailing: IconButton(
                onPressed: () {},
                iconSize: 25,
                icon: const Icon(CupertinoIcons.arrow_right),
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
                maxLines: 3,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: appTextstyle(14, Colors.white54, FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 10),
              child: Text(
                "Other Platforms",
                style: appTextstyle(16, Colors.white, FontWeight.w600),
              ),
            ),
            platformLists(context)
          ],
        ),
      ),
    );
  }

  SizedBox platformLists(BuildContext context) {
    List<String> platforms = ["PC", "Xbox", "PlayStation", "Nintendo"];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 35,
      child: ListView.builder(
        itemCount: platforms.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(left: index == 0 ? 0 : 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffFBCD00)),
            child: Center(
              child: Text(
                platforms[index],
                style:
                    appTextstyle(12, AppColors.primaryColor, FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.imgList,
  });

  final List<String> imgList;

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
            child: Image.asset(
              imgList[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
