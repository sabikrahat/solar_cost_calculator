import 'package:flutter/material.dart';

import '../helpers/constants/constants.dart';
import '../helpers/size_config/size_config.dart';
import 'kappbar.dart';

class KContainer extends StatelessWidget {
  const KContainer({
    Key? key,
    required this.child,
    this.isHomeScreen = false,
    this.isCharShow = false,
    this.title = 'Solar Cost Calculator',
  }) : super(key: key);

  final Widget child;
  final bool isHomeScreen;
  final bool isCharShow;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: ScreenSize.width > 700 ? 700 : ScreenSize.width,
        height: ScreenSize.height,
        child: Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: KAppBar(
                isCharShow: isCharShow,
                isHomeScreen: isHomeScreen,
                title: title,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
                padding: const EdgeInsets.all(5.0),
                width: ScreenSize.width > 700 ? 700 : ScreenSize.width,
                // height: ScreenSize.height - Size.fromHeight(50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color: kLightPrimaryColor,
                    width: 1.0,
                  ),
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
