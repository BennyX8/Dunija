import 'dart:io';

import 'package:dunija/core/utils/strings.dart';
import 'package:dunija/features/shopping_list/app/pages/shopping_list.dart';
import 'package:dunija/recipe_categories/recipe_category_page.dart';
import 'package:dunija/layout/welcome_page.dart/widgets/main_item.dart';
import 'package:dunija/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.darkAccent,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 8.0,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(32.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: AppColors.lightAccent)),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text('Login')
                  ],
                ),
              ),
              onTap: () {},
            ),
          )
        ],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.center,
            image: AssetImage('assets/imgs/welcome_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/imgs/dunija.png'),
                  width: 180.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  // keyboardDismissBehavior:
                  //     ScrollViewKeyboardDismissBehavior.onDrag,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  children: [
                    MainItem(
                      image: 'prepare',
                      title: 'Prepare a Meal',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeCategoriesPage(),
                            settings: RouteSettings(name: '/Recipe'),
                          ),
                        );
                      },
                    ),
                    MainItem(
                      image: 'plan',
                      title: 'Plan a Meal',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShoppingListView(),
                            settings: RouteSettings(name: '/List'),
                          ),
                        );
                      },
                    ),
                    MainItem(
                      image: 'list',
                      title: 'Shopping Book',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShoppingListView(),
                            settings: RouteSettings(name: '/List'),
                          ),
                        );
                      },
                    ),
                    MainItem(
                      image: 'premium',
                      title: 'Premium Offers',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(32.0),
                      child: Icon(
                        Icons.share,
                        color: AppColors.lightAccent,
                      ),
                      onTap: () {
                        if (Platform.isAndroid) {
                          Share.share(AppStrings.playstoreLink);
                          print('Shared Android');
                        } else {
                          Share.share(AppStrings.appstoreLink,
                              subject: 'Share App');
                          print('Shared, Apple');
                        }
                      },
                    ),
                    Icon(
                      Icons.mark_chat_unread_rounded,
                      color: AppColors.lightAccent,
                    ),
                    Icon(
                      Icons.app_settings_alt,
                      color: AppColors.lightAccent,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
