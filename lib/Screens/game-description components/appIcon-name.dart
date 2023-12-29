
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gameapp/utils/sizeconfig.dart';
import 'package:gameapp/utils/textstyle.dart';

Row topComponet(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        SizedBox(
          width: SizeConfig(context: context).width * 0.66,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apex Legend - Mirage Edition",
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
                        "Shooter",
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
                              "4.5",
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
