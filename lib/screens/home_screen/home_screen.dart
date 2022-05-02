import 'package:flutter/material.dart';
import 'package:solar_cost_calculator/components/kcontainer.dart';

import 'components/body.dart' show Body;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: KContainer(
        isHomeScreen: true,
        child: Body(),
      ),
    );
  }
}
