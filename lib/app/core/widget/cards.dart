import 'package:flutter/material.dart';

class HomeCards extends StatefulWidget {
  const HomeCards({super.key, required this.title, required this.onTap, required this.image, required this.cardWidthPercentage});
  final String title;
  final VoidCallback onTap;
  final String image;
  final double cardWidthPercentage;

  @override
  State<HomeCards> createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final cardWidth=screenWidth * widget.cardWidthPercentage;
    final imageWidth=cardWidth*0.375;
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height:cardWidth,
        width: cardWidth,
        child: Card(
          elevation: 0,
          margin: EdgeInsets.only(left: 4,top: 8),
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(widget.image, width: imageWidth,
                  height: imageWidth,),
                SizedBox(height: 8),
                Text(widget.title,style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
