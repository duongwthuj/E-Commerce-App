import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';

import '../../../utlis/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key, required this.text, required this.selected, this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunction.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? TColors.white: null),
      avatar:isColor?  CircularContainer(width: 50, height: 50, backgroundColor: THelperFunction.getColor(text)!):null,
      shape: isColor ? const CircleBorder() : null,
      labelPadding:  isColor ? const EdgeInsets.all(0) : null,
      padding:  isColor ? const EdgeInsets.all(0) : null,
      // selectedColor: Colors.green,
      backgroundColor: isColor ? THelperFunction.getColor(text)! : null,
    );
  }
}