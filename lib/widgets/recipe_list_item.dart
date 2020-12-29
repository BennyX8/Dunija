import 'package:dunija/layout/dialog/infodialog.dart';
import 'package:dunija/layout/kitchen_screen.dart';
import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  final String title, category;
  final image;
  RecipeListItem(
      {@required this.title, @required this.category, @required this.image});

  @override
  Widget build(BuildContext context) {
    ////////////////////////////////////////
    /// Recipe list item MODEL
    ////////////////////////////////////////

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
              spreadRadius: 0.5,
              blurRadius: 3.0,
              color: AppColors.darkAccent.withOpacity(0.2),
              offset: Offset(0, 1))
        ],
        borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
      ),
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          print(title.toString());
          Future.delayed(Duration(seconds: 2), () {
            //Dismiss Loading dialog
            Navigator.pop(context);

            //Navigate to Kitchen Screen
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return KitchenScreen(recipe: title.toString());
            }));
          });

          InfoDialog.showLoadingDialog(context, msg: 'Preparing your kitchen');
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
          ),
          //Child
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: AppColors.accent,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title.toString(),
                      style: AppStyles.setTextStyle(
                          weight: FontWeight.bold, size: 14.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      category.toString(),
                      style:
                          AppStyles.setTextStyle(size: 12.0, color: 0xFF6f6f6f),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.favorite_outline,
                      color: AppColors.accent.withOpacity(0.9),
                      size: 16.0,
                    ),
                    onTap: () {},
                    // color: AppColors.accent.withOpacity(0.9),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),

                  ///Mark to be added as RECIPE REMINDER button in Future Version
                  InkWell(
                    child: Icon(
                      Icons.alarm,
                      color: AppColors.darkAccent.withOpacity(0.8),
                      size: 16.0,
                    ),
                    onTap: () {},
                    // color: AppColors.darkAccent.withOpacity(0.8),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}