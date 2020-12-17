import 'package:dunija/layout/kitchen_screen.dart';
import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/custom_icon_icons.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/strings.dart';
import 'package:dunija/settings/styles.dart';
import 'package:dunija/widgets/search_field.dart';
import 'package:flutter/material.dart';

class PorridgesScreen extends StatefulWidget {
  @override
  _PorridgesScreenState createState() => _PorridgesScreenState();
}

class _PorridgesScreenState extends State<PorridgesScreen> {
  @override
  Widget build(BuildContext context) {
    Numbers.deviceHeight = MediaQuery.of(context).size.height;
    Numbers.deviceWidth = MediaQuery.of(context).size.width;

    //Page Name
    final pageName = AppStrings.porridges;

    //
    return Scaffold(
      body: Stack(children: [
        Container(
          color: AppColors.accent,
          width: Numbers.deviceWidth,
          height: Numbers.deviceHeight,
        ),
        Positioned(
          top: 0.0,
          child: Image(
            image: AssetImage('assets/imgs/top_food.png'),
            fit: BoxFit.contain,
            width: Numbers.deviceWidth,
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Image(
            image: AssetImage('assets/imgs/top_right.png'),
            width: 200.0,
          ),
        ),
        Positioned(
          top: 0.0,
          right: -50.0,
          child: Image(
            image: AssetImage('assets/imgs/top_right.png'),
            width: 200.0,
          ),
        ),
        Positioned(
          top: 40.0,
          child: Container(
            width: Numbers.deviceWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      InkWell(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.whiteColor,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]),
                    SizedBox(
                      width: 5.0,
                    ),
                    Image(
                      image: AssetImage('assets/imgs/dunija.png'),
                      width: 120.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: CircleAvatar(
                        backgroundColor: AppColors.darkAccent.withOpacity(0.5),
                        child: Icon(
                          Icons.search,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      onTap: () {
                        //Handle on tap
                        showSearch(
                          context: context,
                          delegate: SearchField(),
                        );
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        backgroundColor: AppColors.darkAccent.withOpacity(0.7),
                        child: Icon(
                          CustomIcon.food,
                          size: 20,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 130.0,
          child: Padding(
            child: Container(child: Text(pageName, style: AppStyles.pageTitle)),
            padding: EdgeInsets.only(left: 20.0),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: Numbers.deviceWidth,
            height: Numbers.deviceHeight * (3 / 4),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  Numbers.mediumBoxBorderRadius,
                ),
                topRight: Radius.circular(
                  Numbers.mediumBoxBorderRadius,
                ),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color(0x33000000),
                    spreadRadius: 1.0,
                    blurRadius: 15.0)
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              child: InkWell(
                child: Text('Kitchen'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //
                    return KitchenScreen();
                  }));
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
