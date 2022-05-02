import 'package:flutter/material.dart';

import '../helpers/constants/constants.dart';
import '../helpers/size_config/size_config.dart';

class KButton extends StatelessWidget {
  const KButton({
    Key? key,
    this.onTap,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  final void Function()? onTap;
  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kLightPrimaryColor,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 35.0,
        width: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: kLightPrimaryColor.withOpacity(0.5),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: mainCenter,
          children: [
            Icon(
              iconData,
              size: 16.0,
              color: kLightPrimaryColor,
            ),
            const SizedBox(width: 2.0),
            Text(
              label,
              style: TextStyle(color: kLightPrimaryColor, fontSize: 13.0),
            ),
          ],
        ),
      ),
    );
  }
}
