import 'package:flutter/material.dart';

class ECACards extends StatefulWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  final double cardWidthPercentage; // Add a property for card width percentage

  const ECACards({Key? key, required this.image, required this.title, required this.onTap, required this.cardWidthPercentage});

  @override
  State<ECACards> createState() => _ECACardsState();
}

class _ECACardsState extends State<ECACards> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final cardWidth = screenWidth * widget.cardWidthPercentage;
    final imageWidth = cardWidth * 0.4;
    final imageHeight = cardWidth * 0.35;

    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        // height:  MediaQuery.of(context).size.height * 0.09,
        // width: MediaQuery.of(context).size.width * 0.22,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white,
          margin: EdgeInsets.all(3),
          child: Container(
            padding: EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(widget.image, height: imageHeight, width: imageWidth),
                SizedBox(height: 08),
                Text(widget.title,style: TextStyle(
                  fontSize: 10,fontWeight: FontWeight.w400
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
