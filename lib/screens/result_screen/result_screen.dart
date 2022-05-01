import 'package:flutter/material.dart';
import 'package:solar_cost_calculator/components/kcontainer.dart';
import 'components/body.dart' show Body;

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const KContainer(
      title: 'Cost Estimate',
      child: Body(),
    );
  }
}