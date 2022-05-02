import 'package:flutter/material.dart';

import '../helpers/constants/constants.dart';
import '../screens/visualization/visualization.dart';

import '../helpers/routes/custom_routes.dart';
import '../screens/home_screen/home_screen.dart';

class KAppBar extends StatelessWidget {
  const KAppBar({
    Key? key,
    this.isHomeScreen = false,
    this.isCharShow = false,
    this.title = 'Solar Cost Calculator',
  }) : super(key: key);

  final bool isHomeScreen;
  final bool isCharShow;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isHomeScreen == false)
                InkWell(
                  child: Icon(Icons.arrow_back, color: kLightPrimaryColor),
                  onTap: () => Navigator.pop(context),
                ),
              const SizedBox(width: 8.0),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  FadeRoute(
                    page: const HomeScreen(),
                  ),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.asset(
                        'assets/icons/app-icon-1024x1024.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 7.0),
              Text(
                title,
                style: TextStyle(color: kLightPrimaryColor, fontSize: 17.0),
              ),
            ],
          ),
          const SizedBox.shrink(),
        ],
      ),
      actions: [
        if (isCharShow)
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 2.0),
                  child: Icon(
                    Icons.line_axis,
                    color: kLightPrimaryColor.withOpacity(0.9),
                  ),
                ),
              ),
              onTap: () => Navigator.push(
                context,
                SlideLeftRoute(
                  page: const Visualization(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
