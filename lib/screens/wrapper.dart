import 'package:flutter/material.dart'
    show BuildContext, Key, StatelessWidget, Widget;
import 'package:solar_cost_calculator/screens/home_screen/home_screen.dart';

import '../helpers/size_config/size_config.dart' show ScreenSize;

class Wrapper extends StatelessWidget {
  final ScreenSize _sizeConfig = ScreenSize();

  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);
    return const HomeScreen();
  }
}
