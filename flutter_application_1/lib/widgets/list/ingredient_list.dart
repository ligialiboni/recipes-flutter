import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';

class IngredientList extends StatelessWidget {
  final List ingredients;
  final EdgeInsetsGeometry padding;

  const IngredientList({
    Key? key,
    required this.ingredients,
    this.padding = const EdgeInsets.only(left: 3),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          if (ingredients[index] == ' - ' ||
              ingredients[index] == '-' ||
              ingredients[index] == ' -  ' ||
              ingredients[index] == '  - ') {
            return const SizedBox();
          }
          return Text(
            '▪' + ingredients[index],
            style: const TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w100,
              color: kDarkGreyFontColor,
              fontSize: 15,
            ),
          );
        },
      ),
    );
  }
}
