import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/Widgets/description-container.dart';
import 'package:gameapp/utils/app-colors.dart';
import 'package:gameapp/utils/sizeconfig.dart';
import 'package:gameapp/utils/textstyle.dart';

class GameDetailScreen extends StatelessWidget {
  const GameDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: SizeConfig(context: context).height,
          child: Stack(
            children: [
              Container(
                  height: SizeConfig(context: context).height * 0.33,
                  width: SizeConfig(context: context).width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/bg1.jpg",
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(left: 15, top: 15),
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
                  )),
              Positioned(
                top: SizeConfig(context: context).height * 0.3,
                child: const DescriptionContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
