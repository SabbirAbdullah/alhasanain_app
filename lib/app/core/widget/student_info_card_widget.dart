
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/app_values.dart';

class InfoCard extends StatelessWidget {
  final Widget child;
  const InfoCard({super.key, required this.child});


  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: .5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: AppValues.padding,top: 8,bottom: 8,right: 8),
              child: child,))

    );
  }
}
