import 'package:flutter/material.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_field_decoration.dart';
import '../../../core/values/text_styles.dart';

Widget filterCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: AppValues.buttonVerticalPadding,
        vertical: AppValues.halfPadding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "All Payment",
          style: blackText16_600,
        ),
        SizedBox(height: 8,),
        // SizedBox(
        //   width: 120,
        //   child: DropdownButtonFormField(
        //     icon: const Icon(Icons.keyboard_arrow_down),
        //     hint: const Text("All", style: TextStyle(fontSize: 12)),
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return 'Choose type*';
        //       }
        //       return null;
        //     },
        //     decoration: lightBorderTextFieldDecoration,
        //     onChanged: (newValue) {},
        //     items: <String>[
        //       "All",
        //       "Due",
        //       "Paid",
        //     ].map<DropdownMenuItem<String>>((String value) {
        //       return DropdownMenuItem<String>(
        //         value: value,
        //         child: Text(
        //           value,
        //           style: const TextStyle(fontSize: 16),
        //         ),
        //       );
        //     }).toList(),
        //   ),
        // ),
      ],
    ),
  );
}
