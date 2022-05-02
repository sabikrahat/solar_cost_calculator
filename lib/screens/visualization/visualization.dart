import 'package:flutter/material.dart';
import '../../components/kcontainer.dart';

import 'components/body.dart';

class Visualization extends StatelessWidget {
  const Visualization({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const KContainer(
      title: 'Visualization',
      child: Body(),
    );
  }
}