import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  GradientAppBar({Key? key})
      : preferredSize = const Size.fromHeight(0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(

      preferredSize: preferredSize,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x00e6F9FF),
              Color(0xffe9fff8),
              Color(0xfffff6e2)
            ], // Add your desired colors here
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent, // Make AppBar background transparent
          elevation: 0,
          scrolledUnderElevation: 0,// Remove shadow
        ),
      ),
    );
  }
}
