import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/Widgets/game-card.dart';
import 'package:gameapp/Widgets/genre-filter.dart';
import 'package:gameapp/utils/app-colors.dart';
import 'package:gameapp/utils/textstyle.dart';

class GameListScreen extends StatefulWidget {
  const GameListScreen({Key? key});

  @override
  State<GameListScreen> createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  contentPadding: const EdgeInsets.only(
                      left: 30, right: 15, top: 10, bottom: 5),
                  title: Text(
                    "Game Lists",
                    style: appTextstyle(24, Colors.white, FontWeight.w600),
                  ),
                  trailing: IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.ellipsis_vertical,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const GenreFilter(),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                itemCount: 5,
                shrinkWrap:
                    true, // To make sure it only takes the space it needs
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
                itemBuilder: (context, index) {
                  return const GameCard(); // You can provide dynamic data for each card
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
