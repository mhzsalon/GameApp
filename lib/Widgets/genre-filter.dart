import 'package:flutter/material.dart';
import 'package:gameapp/utils/app-colors.dart';
import 'package:gameapp/utils/textstyle.dart';

class GenreFilter extends StatefulWidget {
  const GenreFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<GenreFilter> createState() => _GenreFilterState();
}

class _GenreFilterState extends State<GenreFilter> {
  String selectedGenre = "All";

  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "All",
      "Shooter",
      "RPG",
      "Sports",
      "Action",
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 35,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemCount: genres.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  // Update the selected genre
                  selectedGenre = genres[index];
                });
                // Perform other actions associated with genre selection
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(left: index == 0 ? 0 : 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedGenre == genres[index]
                        ? const Color(0xffFBCD00)
                        : AppColors.secondaryColor),
                child: Center(
                  child: Text(
                    genres[index],
                    style: appTextstyle(
                        12,
                        selectedGenre == genres[index]
                            ? AppColors.primaryColor
                            : Colors.white,
                        FontWeight.w500),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
