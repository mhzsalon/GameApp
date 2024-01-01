// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:gameapp/Model/game_model.dart';
import 'package:gameapp/Screens/Game%20Description%20Screen/game_descrption.dart';
import 'package:gameapp/utils/app-colors.dart';
import 'package:gameapp/utils/textstyle.dart';
import 'package:intl/intl.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class GameCard extends StatelessWidget {
  Result data;
  GameCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String releasedDate = DateFormat('yyyy-MM-dd').format(data.released);
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameDetailScreen(gameData: data),
          )),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
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
                image: DecorationImage(
                  image: NetworkImage(data.backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: appTextstyle(16, Colors.white, FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Release Date: $releasedDate",
                  style: appTextstyle(12, Colors.white54, FontWeight.w500),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Metacritic: ${data.metacritic ?? 0}",
                  style: appTextstyle(12, Colors.white54, FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
