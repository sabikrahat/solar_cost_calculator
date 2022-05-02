import 'package:flutter/material.dart';
import '../helpers/size_config/size_config.dart';

class KRadioButton extends StatelessWidget {
  const KRadioButton({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
    required this.groupValue,
    this.onLabelTap,
  }) : super(key: key);

  final String label;
  final int value;
  final int groupValue;
  final void Function(int?)? onChanged;
  final void Function()? onLabelTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainCenter,
      mainAxisSize: mainMin,
      children: [
        Radio(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        InkWell(
          onTap: onLabelTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
