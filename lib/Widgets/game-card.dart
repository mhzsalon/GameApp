import 'package:flutter/material.dart';
import 'package:gameapp/utils/textstyle.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 1,
      height: size.height * 0.3,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: BoxDecoration(
        color: const Color(0xff1E2430),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.19,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/bgImg.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Apex Legends - Mirage Edition",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: appTextstyle(16, Colors.white, FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Release Date: 2021-12-23",
                style: appTextstyle(12, Colors.white54, FontWeight.w500),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "Metacritic Score: 80",
                style: appTextstyle(12, Colors.white54, FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ],
          )
        ],
      ),
    );
  }
}
