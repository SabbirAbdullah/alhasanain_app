import 'package:flutter/material.dart';

class ECAClubGrids extends StatelessWidget {
  const ECAClubGrids({
    super.key,required this.clubName, required this.imageAsset
  });
final String clubName;
final String imageAsset;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(8.0), // Margin around each item
      child: Padding(
        padding: const EdgeInsets.only(left:32.0,right: 32,top: 8,bottom: 8),
        child: Column(
          children:[
            Image.asset(
              imageAsset,
              width: MediaQuery.of(context).size.width*0.10, // Adjust the width as needed
              height: MediaQuery.of(context).size.height*0.10, // Adjust the height as needed
            ),
            Text(
            clubName,
            style: TextStyle(fontSize: 12.0),
          ),]
        ),
      ),
    );
  }
}
