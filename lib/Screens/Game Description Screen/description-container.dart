// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/Model/game_detail_model.dart';
import 'package:gameapp/Model/game_model.dart';
import 'package:gameapp/Widgets/imageSlider.dart';
import 'package:gameapp/utils/app-colors.dart';
import 'package:gameapp/utils/common.dart';
import 'package:gameapp/utils/sizeconfig.dart';
import 'package:gameapp/utils/textstyle.dart';
import 'package:readmore/readmore.dart';

class DescriptionContainer extends StatefulWidget {
  Result gameData;
  GameModel model;

  DescriptionContainer(
      {super.key, required this.gameData, required this.model});

  @override
  State<DescriptionContainer> createState() => _DescriptionContainerState();
}

class _DescriptionContainerState extends State<DescriptionContainer> {
  @override
  Widget build(BuildContext context) {
    var filteredDesc = removeHtmlTags(widget.model.description);

    return Container(
      // width: SizeConfig(context: context).width,
      // height: SizeConfig(context: context).height * 0.7,
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
            // Top component of the description container
            topComponent(
              context,
            ),
            const SizedBox(
              height: 35,
            ),

            // ImageSlider to display screenshots
            ImageSlider(imgList: [
              widget.model.backgroundImage,
              widget.model.backgroundImageAdditional
            ]),

            // "About this game" section
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 10),
              child: Text(
                "About this game",
                style: appTextstyle(16, Colors.white, FontWeight.w600),
              ),
            ),

            // Description text
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: ReadMoreText(
                filteredDesc,
                trimLines: 4,
                trimCollapsedText: " Read more",
                trimExpandedText: " Read less",
                trimMode: TrimMode.Line,
                textAlign: TextAlign.justify,
                style: appTextstyle(14, Colors.white54, FontWeight.normal),
              ),
            ),
            //Developer Info
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                "Developer",
                style: appTextstyle(16, Colors.white, FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(
                widget.model.developers[0].name,
                textAlign: TextAlign.justify,
                style: appTextstyle(14, Colors.white54, FontWeight.normal),
              ),
            ),
            //Publisher Info
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                "Publisher",
                style: appTextstyle(16, Colors.white, FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(
                widget.model.publishers[0].name,
                textAlign: TextAlign.justify,
                style: appTextstyle(14, Colors.white54, FontWeight.normal),
              ),
            ),

            // "Other Platforms" section
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                "Other Platforms",
                style: appTextstyle(16, Colors.white, FontWeight.w600),
              ),
            ),
            // List of platforms
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: platformLists(context),
            ),
          ],
        ),
      ),
    );
  }

  // Top component of the description container
  Row topComponent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Game icon container
        Container(
          height: SizeConfig(context: context).height * 0.098,
          width: SizeConfig(context: context).width * 0.205,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            'assets/appIcon.jpg',
            fit: BoxFit.cover,
          ),
        ),

        // Game details
        SizedBox(
          width: SizeConfig(context: context).width * 0.66,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.name,
                  maxLines: 2,
                  style: appTextstyle(16, Colors.white, FontWeight.w600),
                ),
                SizedBox(
                  height: SizeConfig(context: context).height * 0.009,
                ),
                SizedBox(
                  width: SizeConfig(context: context).width * 0.66,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.model.genres[0].name,
                        style:
                            appTextstyle(14, Colors.white60, FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      SizedBox(
                        width: 95,
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.star_fill,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.model.rating,
                              style: appTextstyle(
                                  12, Colors.white, FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  // List of platforms
  SizedBox platformLists(BuildContext context) {
    List<PlatformElement> platforms = widget.model.platforms;
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
              color: AppColors.yellow,
            ),
            child: Center(
              child: Text(
                platforms[index].platform.name,
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
