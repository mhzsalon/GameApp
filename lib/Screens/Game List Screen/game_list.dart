// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/Model/game_model.dart';
import 'package:gameapp/Repository/game_list_repo.dart';
import 'package:gameapp/Widgets/game-card.dart';
import 'package:gameapp/Widgets/genre-filter.dart';
import 'package:gameapp/utils/sizeconfig.dart';
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
              // Title "Game Lists"
              SizedBox(
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  contentPadding: const EdgeInsets.only(
                      left: 30, right: 15, top: 10, bottom: 5),
                  title: Text(
                    "Game Lists",
                    style: appTextstyle(24, Colors.white, FontWeight.w600),
                  ),
                  // trailing: IconButton(
                  //   color: Colors.white,
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     CupertinoIcons.ellipsis_vertical,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ),
              ),

              // GenreFilter widget
              const GenreFilter(),
              const SizedBox(
                height: 15,
              ),

              // Container for displaying game cards
              Consumer(
                builder: (context, ref, child) {
                  final selectedGenre = ref.watch(selectedGenreProvider);

                  return ref.watch(remoteResultData).when(
                        data: (data) {
                          // Convert Iterable<Result> to List<Result>
                          final List<Result> dataList = data.toList();

                          // Filter the data based on the selected genre
                          final filteredData = selectedGenre == "All"
                              ? dataList
                              : dataList
                                  .where((game) => game.genres.any(
                                      (genre) => genre.name == selectedGenre))
                                  .toList();

                          // Displaying a ListView of GameCards using filteredData
                          return ListView.builder(
                            itemCount: filteredData.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final currentData = filteredData[index];
                              return GameCard(
                                data: currentData,
                              );
                            },
                          );
                        },
                        error: (error, stackTrace) {
                          // Displaying a SnackBar in case of a connection timeout error
                          return const SnackBar(
                              content: Text("Connection Time out"));
                        },
                        loading: () => SizedBox(
                          width: SizeConfig(context: context).width,
                          height: SizeConfig(context: context).height * 0.7,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
