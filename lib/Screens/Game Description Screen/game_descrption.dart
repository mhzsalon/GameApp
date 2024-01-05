// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/Model/game_model.dart';
import 'package:gameapp/Repository/game_detail_repo.dart';
import 'package:gameapp/Screens/Game%20Description%20Screen/description-container.dart';
import 'package:gameapp/utils/app-colors.dart';
import 'package:gameapp/utils/sizeconfig.dart';

class GameDetailScreen extends StatelessWidget {
  Result gameData;
  GameDetailScreen({super.key, required this.gameData});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return ref.watch(gameDataProvider).when(
            data: (dataModel) {
              return Scaffold(
                body: SafeArea(
                  child: SizedBox(
                    height: SizeConfig(context: context).height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Background image container
                          Container(
                            height: SizeConfig(context: context).height * 0.3,
                            width: SizeConfig(context: context).width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(dataModel.backgroundImage),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Back button container
                                Container(
                                  height: 50,
                                  width: 50,
                                  margin:
                                      const EdgeInsets.only(left: 15, top: 15),
                                  decoration: BoxDecoration(
                                    color: AppColors.iconButtonColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                    onPressed: () => Navigator.pop(context),
                                    color: Colors.white,
                                    icon: const Icon(CupertinoIcons.back),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //description container
                          DescriptionContainer(
                              gameData: gameData, model: dataModel),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            error: (error, stackTrace) => throw Exception(error),
            loading: () => const CircularProgressIndicator(),
          );
    });
  }
}
